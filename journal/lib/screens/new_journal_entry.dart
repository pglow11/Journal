import 'package:flutter/material.dart';
import 'package:journal/components/journal_scaffold.dart';
import 'package:journal/screens/journal_entries_screen.dart';
import 'package:journal/components/dropdown_rating_form_field.dart';
import '../db/journal_entry_dto.dart';
import '../db/database_manager.dart';

class NewJournalEntry extends StatefulWidget {
  static const routeName = 'new_journal_entry';

  const NewJournalEntry({Key? key}) : super(key: key);

  @override
  _NewJournalEntryState createState() => _NewJournalEntryState();
}

class _NewJournalEntryState extends State<NewJournalEntry> {
  final _formKey = GlobalKey<FormState>();

  final title = 'New Journal Entry';
  final int maxRating = 4;
  final journalEntryValues = JournalEntryDTO();

  @override
  Widget build(BuildContext context) {
    return JournalScaffold(
      title: title,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(),
              ),
              validator: someTextValidator,
              onSaved: (value) {
                // Store in DTO field
                journalEntryValues.title = value;
              },
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Body',
                border: OutlineInputBorder(),
              ),
              validator: someTextValidator,
              onSaved: (value) {
                // Store in DTO field
                journalEntryValues.body = value;
              },
            ),
            const SizedBox(
              height: 10.0,
            ),
            DropdownRatingFormField(
              maxRating: maxRating,
              validator: dropdownValidator,
              onSaved: dropdownOnSaved,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    setDateTimeField();
                    final databaseManager = DatabaseManager.getInstance();
                    databaseManager.saveJournalEntry(dto: journalEntryValues);
                    pushJournalEntriesScreen(context);
                  }
                },
                child: const Text('Save'),
              ),
            ]),
          ]),
        ),
      ),
    );
  }

  String? dropdownValidator(value) {
    if (value == null) {
      return 'Please select a rating value';
    } else {
      return null;
    }
  }

  void dropdownOnSaved(value) {
    // Do Something
    journalEntryValues.rating = value;
  }

  String? someTextValidator(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    } else {
      return null;
    }
  }

  void setDateTimeField() {
    journalEntryValues.date = DateTime.now();
  }

  void pushJournalEntriesScreen(BuildContext context) {
    Navigator.of(context).pushNamed(JournalEntriesScreen.routeName);
  }
}
