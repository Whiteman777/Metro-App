String normalize(String s) {
  final out = StringBuffer();
  for (final rune in s.toLowerCase().runes) {
    final isEnglish = rune >= 0x61 && rune <= 0x7a;
    final isArabic = rune >= 0x0600 && rune <= 0x06ff;
    if (isEnglish || isArabic) out.write(String.fromCharCode(rune));
  }
  return out.toString();
}

int levenshtein(String a, String b) {
  if (a == b) return 0;
  final la = a.length, lb = b.length;
  if (la == 0) return lb;
  if (lb == 0) return la;
  var prev = List<int>.generate(lb + 1, (j) => j);
  var curr = List<int>.filled(lb + 1, 0);
  for (var i = 1; i <= la; i++) {
    curr[0] = i;
    for (var j = 1; j <= lb; j++) {
      final cost = a[i - 1] == b[j - 1] ? 0 : 1;
      curr[j] = [
        curr[j - 1] + 1,
        prev[j] + 1,
        prev[j - 1] + cost,
      ].reduce((x, y) => x < y ? x : y);
    }
    final tmp = prev;
    prev = curr;
    curr = tmp;
  }
  return prev[lb];
}



List<String> fuzzyRank(String query, Iterable<String> candidates,
    {int maxDistance = 3}) {
  final q = normalize(query);
  if (q.isEmpty) return const [];
  final scored = <(int, String)>[];
  for (final c in candidates) {
    final d = levenshtein(q, normalize(c));
    if (d <= maxDistance) scored.add((d, c));
  }
  scored.sort((x, y) => x.$1.compareTo(y.$1));
  return scored.map((e) => e.$2).toList();
}
