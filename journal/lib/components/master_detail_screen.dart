import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:journal/components/detail_body.dart';
import 'package:journal/models/journal.dart';

class MasterDetailScreen extends StatefulWidget {
  final Journal journal;
  const MasterDetailScreen({Key? key, required this.journal}) : super(key: key);

  @override
  State<MasterDetailScreen> createState() => _MasterDetailScreenState();
}

class _MasterDetailScreenState extends State<MasterDetailScreen> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.journal.journalEntries.length,
              itemBuilder: ((context, index) {
                return GestureDetector(
                  onTap: (() => setState(() {
                        _index = index;
                      })),
                  child: ListTile(
                    title: Text(widget.journal.journalEntries[index].title),
                    subtitle: Text(DateFormat('MMMM dd, yyyy')
                        .format(widget.journal.journalEntries[index].date)),
                  ),
                );
              }),
            ),
          ),
          Expanded(
              child: DetailBody(
                  journalEntry: widget.journal.journalEntries[_index]))
        ],
      ),
    );
  }
}
