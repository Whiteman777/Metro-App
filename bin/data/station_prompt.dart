import "dart:io";

import "package:collection/collection.dart";

import "../models/station.dart";
import "../models/metro_line.dart";

String normalize(String s) => s.toLowerCase().replaceAll(RegExp(r'[^a-z]'), '');

Station promptForStation(MetroLine line, String prompt) {
  while (true) {
    print(prompt);
    final input = stdin.readLineSync();

    if (input == null || input.trim().isEmpty) {
      print("Input cannot be empty. Try again.");
      continue;
    }

    final found = line.stations.firstWhereOrNull(
      (station) => normalize(station.name) == normalize(input),
    );

    if (found != null) {
      return found;
    }
    print("This station doesn't exist, try again.");
  }
}
