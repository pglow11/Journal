import 'package:flutter/material.dart';
import 'package:journal/components/journal_scaffold.dart';
import 'package:journal/components/journal_list.dart';
import 'package:journal/components/master_detail_screen.dart';
import 'package:journal/components/new_journal_entry_button.dart';
import 'package:journal/models/journal.dart';
import 'package:journal/models/journal_entry.dart';
import 'package:journal/screens/welcome_screen.dart';
import '../db/database_manager.dart';

class JournalEntriesScreen extends StatefulWidget {
  static const routeName = 'journal_entries';

  const JournalEntriesScreen({Key? key}) : super(key: key);

  @override
  State<JournalEntriesScreen> createState() => _JournalEntriesScreenState();
}

class _JournalEntriesScreenState extends State<JournalEntriesScreen> {
  final String title = 'Journal Entries';
  Journal? journal;

  @override
  void initState() {
    super.initState();
    loadJournal();
  }

  void loadJournal() async {
    final databaseManager = DatabaseManager.getInstance();
    List<Map> journalRecords =
        await databaseManager.db.rawQuery('SELECT * FROM journal_entries');
    final journalEntries = journalRecords.map((record) {
      return JournalEntry(
          title: record['title'],
          body: record['body'],
          rating: record['rating'],
          date: DateTime.parse(record['date']));
    }).toList();
    setState(() {
      journal = Journal(journalEntries: journalEntries);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (journal == null) {
      return const JournalScaffold(
          title: 'Loading', body: Center(child: CircularProgressIndicator()));
    } else {
      if (journal!.journalEntries.isEmpty) {
        return const WelcomeScreen();
      } else {
        return JournalScaffold(
          title: 'Journal Entries',
          body: LayoutBuilder(builder: layoutDecider),
          floatingActionButton: const NewJournalEntryButton(),
        );
      }
    }
  }

  Widget layoutDecider(BuildContext context, BoxConstraints constraints) =>
      constraints.maxWidth < 500
          ? JournalList(journal: journal!)
          : MasterDetailScreen(journal: journal!);
}
