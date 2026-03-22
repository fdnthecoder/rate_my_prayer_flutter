class SalahLog {
  final int? id;
  final DateTime date;
  final String salahName;
  final int rating;
  final String? notes;
  final DateTime loggedAt;

  SalahLog({
    this.id,
    required this.date,
    required this.salahName,
    required this.rating,
    this.notes,
    required this.loggedAt,
  });
}
