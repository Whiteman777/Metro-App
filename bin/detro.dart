import 'dart:io';

import 'data/cairo_university_branch.dart';
import 'data/elmarg_line.dart';
import 'data/elmounib_line.dart';
import 'data/rod_elfarag_line.dart';
import 'data/station_prompt.dart';
import 'models/ticket.dart';
import 'services/metro_graph.dart';

/// Formats minutes >= 60 as "1h 30m" (English-only, real-world style).
String _formatClocked(double minutes) {
  final h = minutes ~/ 60;
  final m = (minutes % 60).round();
  return m == 0 ? '${h}h' : '${h}h ${m}m';
}

void main() {
  final graph = MetroGraph([
    const ElMargLine(),
    const ElMounibLine(),
    const RodElFaragLine(),
    const CairoUniversityBranch(),
  ]);
  final startStation = promptForStation(
    graph,
    "What are your starting station?",
  );
  final stopStation = promptForStation(graph, "What are your stoping station?");
  final trip = graph.shortestTrip(startStation, stopStation);
  final path = trip.stations;
  final hops = trip.hops;
  final duration = trip.minutes;
  final directions = graph.directions(path);
  var transfers = 0;
  for (var i = 0; i < path.length; i++) {
    if (graph.needsChange(path, i)) transfers++;
  }

  print("number of stations => $hops");
  print("number of transfers => $transfers");
  print("direction => ${directions.join(" => ")}");
  final durationLabel = duration >= 60
      ? _formatClocked(duration)
      : "${duration.toStringAsFixed(2)} min";
  print("estimated time => $durationLabel");
  print(
    "price => ${TicketType.forHops(hops).price}, ticket duration => ${TicketType.duration} hours",
  );
  stdout.write("Route => ");
  final display = graph.displayRoute(path);
  for (var i = 0; i < display.length; i++) {
    if (i > 0) stdout.write(" => ");
    stdout.write(display[i]);
  }
  stdout.writeln();
}
