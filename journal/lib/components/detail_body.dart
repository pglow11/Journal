import 'package:flutter/material.dart';
import '../models/journal_entry.dart';

class DetailBody extends StatelessWidget {
  const DetailBody({
    Key? key,
    required this.journalEntry,
  }) : super(key: key);

  final JournalEntry journalEntry;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  journalEntry.title,
                  style: const TextStyle(
                      fontFamily: 'OpenSans',
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  journalEntry.rating.toString(),
                  style: const TextStyle(
                      fontFamily: 'OpenSans',
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Text(
              journalEntry.body,
              style: const TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 14,
              ),
            )
          ],
        ));
  }
}
