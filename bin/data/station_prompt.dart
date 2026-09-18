import "dart:io";

import '../services/metro_graph.dart';
import '../utils/normalize.dart';

String promptForStation(MetroGraph graph, String prompt) {
  while (true) {
    print(prompt);
    final input = stdin.readLineSync();

    if (input == null || input.trim().isEmpty) {
      print("Input cannot be empty. Try again.");
      continue;
    }

    final found = graph.find(input);
    if (found != null) return found;

    final suggestions = fuzzyRank(input, graph.stations);
    if (suggestions.isEmpty) {
      print("This station doesn't exist, try again.");
    } else {
      print("This station doesn't exist. Did you mean: ${suggestions.join(', ')}?");
    }
  }
}
