enum TicketType {
  basic(10),
  standard(12),
  extended(15),
  longDistance(20);

  const TicketType(this.price);
  final int price;
  static const int duration = 2;

  static TicketType forHops(int hops) => switch (hops) {
        <= 9 => basic,
        <= 16 => standard,
        <= 23 => extended,
        _ => longDistance,
      };
}
