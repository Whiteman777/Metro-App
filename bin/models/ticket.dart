enum TicketType {
  basic(10),
  standard(12),
  extended(15),
  longDistance(20);

  const TicketType(this.price);
  final int price;
  static const int duration = 2;

  static TicketType forHops(int hops) {
    if (hops <= 9) return basic;
    if (hops <= 16) return standard;
    if (hops <= 23) return extended;
    return longDistance;
  }
}
