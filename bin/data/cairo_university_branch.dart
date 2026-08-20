import '../models/metro_line.dart';
import '../models/station.dart';

class CairoUniversityBranch extends MetroLine {
  const CairoUniversityBranch()
      : super(name: "cairoUniversity", stations: cairoUniversityBranchStations);

  static const List<Station> cairoUniversityBranchStations = [
    Station(name: 'Kit Kat', order: 1, isTransitional: true),
    Station(name: 'Tawfikia', order: 2, isTransitional: false),
    Station(name: 'Wadi El-Nile', order: 3, isTransitional: false),
    Station(name: 'Gamat El-Dowal', order: 4, isTransitional: false),
    Station(name: 'Boulak El-Dakrour', order: 5, isTransitional: false),
    Station(name: 'Cairo University', order: 6, isTransitional: true),
  ];
}