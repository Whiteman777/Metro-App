import '../models/metro_line.dart';
import '../models/station.dart';

class RodElFaragLine extends MetroLine {
  const RodElFaragLine()
      : super(
          name: "rodelfarag",
          stations: rodElFaragStations,
          headwayMinutes: 4,
          segmentMinutes: 2,
        );

  static const List<Station> rodElFaragStations = [
    Station(name: 'Adly Mansour', order: 1, isTransitional: false),
    Station(name: 'El Haykestep', order: 2, isTransitional: false),
    Station(name: 'Omar Ibn El-Khattab', order: 3, isTransitional: false),
    Station(name: 'Qobaa', order: 4, isTransitional: false),
    Station(name: 'Hesham Barakat', order: 5, isTransitional: false),
    Station(name: 'El-Nozha', order: 6, isTransitional: false),
    Station(name: 'Nadi El-Shams', order: 7, isTransitional: false),
    Station(name: 'Alf Maskan', order: 8, isTransitional: false),
    Station(name: 'Heliopolis Square', order: 9, isTransitional: false),
    Station(name: 'Haroun', order: 10, isTransitional: false),
    Station(name: 'Al-Ahram', order: 11, isTransitional: false),
    Station(name: 'Koleyet El-Banat', order: 12, isTransitional: false),
    Station(name: 'Stadium', order: 13, isTransitional: false),
    Station(name: 'Fair Zone', order: 14, isTransitional: false),
    Station(name: 'Abbassia', order: 15, isTransitional: false),
    Station(name: 'Abdou Pasha', order: 16, isTransitional: false),
    Station(name: 'El Geish', order: 17, isTransitional: false),
    Station(name: 'Bab El Shaaria', order: 18, isTransitional: false),
    Station(name: 'Attaba', order: 19, isTransitional: true),
    Station(name: 'Nasser', order: 20, isTransitional: true),
    Station(name: 'Maspero', order: 21, isTransitional: false),
    Station(name: 'Safaa Hegazy', order: 22, isTransitional: false),
    Station(name: 'Kit Kat', order: 23, isTransitional: true),
    Station(name: 'Sudan', order: 24, isTransitional: false),
    Station(name: 'Imbaba', order: 25, isTransitional: false),
    Station(name: 'El-Bohy', order: 26, isTransitional: false),
    Station(name: 'El-Qawmia', order: 27, isTransitional: false),
    Station(name: 'Ring Road', order: 28, isTransitional: false),
    Station(name: 'Rod El-Farag Corridor', order: 29, isTransitional: false),
  ];
}