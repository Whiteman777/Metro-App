import '../models/metro_line.dart';
import '../utils/normalize.dart';

class MetroGraph {
  late final List<MetroLine> _lines;
  final Map<String, Set<String>> _neighbors = {};
  final Map<String, String> _displayNames = {};
  final Set<String> _transfers = {};

  MetroGraph(List<MetroLine> lines) {
    _lines = lines;
    for (final line in lines) {
      final stations = line.stations;
      for (var i = 0; i < stations.length; i++) {
        final current = normalize(stations[i].name);
        if (_displayNames.containsKey(current)) {
          _transfers.add(current);
        }
        _displayNames.putIfAbsent(current, () => stations[i].name);
        _neighbors.putIfAbsent(current, () => <String>{});

        if (i > 0) _neighbors[current]!.add(normalize(stations[i - 1].name));
        if (i < stations.length - 1) {
          _neighbors[current]!.add(normalize(stations[i + 1].name));
        }
      }
    }
  }

  String? find(String input) {
    final key = normalize(input);
    return _neighbors.containsKey(key) ? key : null;
  }

  bool isTransfer(String displayName) =>
      _transfers.contains(normalize(displayName));

  bool needsChange(List<String> path, int index) {
    if (index < 1 || index >= path.length - 1) return false;
    final inLine = _lineOfSegment(path[index - 1], path[index]);
    final outLine = _lineOfSegment(path[index], path[index + 1]);
    return inLine != null && outLine != null && inLine.name != outLine.name;
  }

  MetroLine? _lineOfSegment(String a, String b) {
    for (final line in _lines) {
      final orders = <String, int>{};
      for (final s in line.stations) {
        orders[normalize(s.name)] = s.order;
      }
      final oa = orders[normalize(a)];
      final ob = orders[normalize(b)];
      if (oa != null && ob != null && (oa - ob).abs() == 1) {
        return line;
      }
    }
    return null;
  }

  List<String> displayRoute(List<String> path) {
    if (path.length <= 5) return _withChangeMarkers(path);

    final show = <int>{0, 1, path.length - 2, path.length - 1};
    for (var i = 0; i < path.length; i++) {
      if (needsChange(path, i)) {
        show.add(i);
        if (i + 1 < path.length) show.add(i + 1);
      }
    }

    final sorted = show.toList()..sort();
    final result = <String>[];
    var last = -1;
    for (final i in sorted) {
      if (result.isNotEmpty && i > last + 1) result.add('...');
      result.add(path[i] + (needsChange(path, i) ? ' (change)' : ''));
      last = i;
    }
    return result;
  }

  List<String> _withChangeMarkers(List<String> path) {
    return [
      for (var i = 0; i < path.length; i++)
        path[i] + (needsChange(path, i) ? ' (change)' : ''),
    ];
  }

  List<String> shortestPath(String start, String stop) {
    final visited = <String>{start};
    final queue = <String>[start];
    final previous = <String, String>{};
    var head = 0;

    while (head < queue.length) {
      final current = queue[head++];
      if (current == stop) break;
      for (final next in _neighbors[current] ?? const <String>[]) {
        if (!visited.contains(next)) {
          visited.add(next);
          previous[next] = current;
          queue.add(next);
        }
      }
    }

    if (!visited.contains(stop)) return [];

    final path = <String>[];
    var step = stop;
    while (step != start) {
      path.add(_displayNames[step]!);
      step = previous[step]!;
    }
    path.add(_displayNames[start]!);
    return path.reversed.toList();
  }

  List<String> directions(List<String> path) {
    if (path.length < 2) return ['None'];

    final result = <String>[];
    var legStart = 0;
    var line = _lineOfSegment(path[0], path[1]);

    for (var i = 2; i < path.length; i++) {
      final segmentLine = _lineOfSegment(path[i - 1], path[i]);
      if (segmentLine != line) {
        result.add(_legDirection(line!, path, legStart, i - 1));
        line = segmentLine;
        legStart = i - 1;
      }
    }
    result.add(_legDirection(line!, path, legStart, path.length - 1));
    return result;
  }

  String _legDirection(MetroLine line, List<String> path, int start, int end) {
    final orders = <String, int>{};
    for (final s in line.stations) {
      orders[normalize(s.name)] = s.order;
    }
    final firstOrder = orders[normalize(path[start])]!;
    final lastOrder = orders[normalize(path[end])]!;
    return lastOrder > firstOrder
        ? line.stations.last.name
        : line.stations.first.name;
  }
}
