class PracticeLog {
  final int? id;
  final DateTime date;
  final int rakat;
  final int rating;
  final String? notes;
  final DateTime loggedAt;

  PracticeLog({
    this.id,
    required this.date,
    required this.rakat,
    required this.rating,
    this.notes,
    required this.loggedAt,
  });
}
