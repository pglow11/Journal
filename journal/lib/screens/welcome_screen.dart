import "package:flutter/material.dart";
import 'package:journal/components/journal_scaffold.dart';
import 'package:journal/components/new_journal_entry_button.dart';

class WelcomeScreen extends StatelessWidget {
  static const routeName = '/';

  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return JournalScaffold(
        title: 'Welcome',
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                    "assets/images/pexels-jessica-lewis-creative-606539.jpg"),
                fit: BoxFit.cover),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(),
                Container(
                  child: const Icon(
                    Icons.book_outlined,
                    size: 90.0,
                  ),
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.greenAccent,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.black,
                      width: 4.0,
                    ),
                  ),
                ),
                const Text(
                  'Journal',
                  style: TextStyle(
                      fontFamily: 'OpenSans',
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: const NewJournalEntryButton());
  }
}
