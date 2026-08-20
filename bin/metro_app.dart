import 'dart:math';

import '../bin/data/elmarg_line.dart';
import 'models/station.dart';
import 'models/ticket.dart';

import 'dart:io';

import 'data/station_prompt.dart';

void main() {
  final margLine = const ElMargLine();
  final startStation = promptForStation(
    margLine,
    "What are your starting station?",
  );
  final stopStation = promptForStation(
    margLine,
    "What are your stoping station?",
  );
  final start = startStation.order;
  final stop = stopStation.order;
  final int hops;
  final double duration;
  final String direction;
  final int low = min(start, stop);
  final int high = max(start, stop);

  hops = (stop - start).abs();
  duration = hops * 2.25;
  direction = (stop > start)
      ? "Helwan"
      : (stop < start)
      ? "New El-Marg"
      : "None";

  List<Station> route = margLine.stations
      .where((station) => low <= station.order && station.order <= high)
      .toList();

  if (start > stop) {
    route = route.reversed.toList();
  }

  print("number of stations => $hops");
  print("direction => $direction");
  print("estimated time => $duration min");
  print(
    "price => ${TicketType.forHops(hops).price}, ticket duration => ${TicketType.duration} hours",
  );
  stdout.write("Route => ");
  for (var i = 0; i < route.length; i++) {
    if (i > 0) stdout.write(" => ");
    stdout.write(route[i].name);
  }
}
