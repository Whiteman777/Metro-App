import '../models/metro_line.dart';
import '../models/station.dart';

class ElMargLine extends MetroLine {
  const ElMargLine() : super(name: "elmarg", stations: elMargStations);

  static const List<Station> elMargStations = [
    Station(name: 'New El-Marg', order: 1),
    Station(name: 'El-Marg', order: 2),
    Station(name: 'Ezbet El-Nakhl', order: 3),
    Station(name: 'Ain Shams', order: 4),
    Station(name: 'El-Matareyya', order: 5),
    Station(name: 'Helmeyet El-Zaitoun', order: 6),
    Station(name: 'Hadayeq El-Zaitoun', order: 7),
    Station(name: 'Saray El-Qobba', order: 8),
    Station(name: 'Hammamat El-Qobba', order: 9),
    Station(name: 'Kobri El-Qobba', order: 10),
    Station(name: 'Manshiet El-Sadr', order: 11),
    Station(name: 'El-Demerdash', order: 12),
    Station(name: 'Ghamra', order: 13),
    Station(name: 'Al-Shohadaa', order: 14),
    Station(name: 'Orabi', order: 15),
    Station(name: 'Nasser', order: 16),
    Station(name: 'Sadat', order: 17),
    Station(name: 'Saad Zaghloul', order: 18),
    Station(name: 'Al-Sayeda Zeinab', order: 19),
    Station(name: 'El-Malek El-Saleh', order: 20),
    Station(name: 'Mar Girgis', order: 21),
    Station(name: 'El-Zahraa', order: 22),
    Station(name: 'Dar El-Salam', order: 23),
    Station(name: 'Hadayek El-Maadi', order: 24),
    Station(name: 'Maadi', order: 25),
    Station(name: 'Sakanat El-Maadi', order: 26),
    Station(name: 'Tora El-Balad', order: 27),
    Station(name: 'Kozzika', order: 28),
    Station(name: 'Tora El-Asmant', order: 29),
    Station(name: 'El-Maasara', order: 30),
    Station(name: 'Hadayek Helwan', order: 31),
    Station(name: 'Wadi Hof', order: 32),
    Station(name: 'Helwan University', order: 33),
    Station(name: 'Ain Helwan', order: 34),
    Station(name: 'Helwan', order: 35),
  ];
}
