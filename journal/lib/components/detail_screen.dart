import 'package:flutter/material.dart';
import 'package:journal/components/journal_scaffold.dart';
import 'package:journal/models/journal_entry.dart';
import 'package:journal/components/detail_body.dart';

class DetailScreen extends StatelessWidget {
  static const routeName = 'detail_screen';
  final String title = 'Journal Entry Details';
  final JournalEntry journalEntry;

  const DetailScreen({Key? key, required this.journalEntry}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return JournalScaffold(
      title: title,
      body: DetailBody(journalEntry: journalEntry),
    );
  }
}
