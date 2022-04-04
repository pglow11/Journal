import 'package:flutter/material.dart';
import '../screens/new_journal_entry.dart';

class NewJournalEntryButton extends StatelessWidget {
  const NewJournalEntryButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => pushNewJournalEntry(context),
      child: const Icon(Icons.note_add_outlined),
    );
  }

  void pushNewJournalEntry(BuildContext context) {
    Navigator.of(context).pushNamed(NewJournalEntry.routeName);
  }
}
