import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../components/detail_screen.dart';
import '../models/journal.dart';
import '../models/journal_entry.dart';

class JournalList extends StatelessWidget {
  final Journal journal;

  const JournalList({Key? key, required this.journal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView.builder(
        itemCount: journal.journalEntries.length,
        itemBuilder: ((
          context,
          index,
        ) {
          return GestureDetector(
            onTap: (() =>
                pushDetailScreen(context, journal.journalEntries[index])),
            child: ListTile(
              trailing: const Icon(Icons.more_horiz),
              title: Text(journal.journalEntries[index].title),
              subtitle: Text(DateFormat('MMMM dd, yyyy')
                  .format(journal.journalEntries[index].date)),
            ),
          );
        }),
      ),
    );
  }

  void pushDetailScreen(BuildContext context, JournalEntry journalEntry) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: ((context) => DetailScreen(journalEntry: journalEntry))));
  }
}
