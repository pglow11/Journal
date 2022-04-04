class JournalEntry {
  final int? id;
  String title;
  String body;
  int rating;
  DateTime date;

  static List<JournalEntry> createEntries() {
    List<JournalEntry> entries = [];
    for (int i = 0; i < 10000; i++) {
      entries.add(JournalEntry(
          title: 'Journal entry $i',
          body: 'Body text for journal entry $i',
          rating: 4,
          date: DateTime.now()));
    }
    return entries;
  }

  JournalEntry(
      {this.id,
      required this.title,
      required this.body,
      required this.rating,
      required this.date});
}
