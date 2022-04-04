import 'package:flutter/material.dart';

class JournalTextFormField extends StatefulWidget {
  final String labelText;

  const JournalTextFormField({Key? key, required this.labelText})
      : super(key: key);

  @override
  State<JournalTextFormField> createState() => _JournalTextFormFieldState();
}

class _JournalTextFormFieldState extends State<JournalTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: widget.labelText,
        border: const OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        } else {
          return null;
        }
      },
      onSaved: (value) {
        // Store in DTO field
      },
    );
  }
}
