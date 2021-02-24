import 'package:flutter/material.dart';
import 'package:journal/models/journal_entry.dart';

class JournalEntryForm extends StatefulWidget {
  static final routeName = 'form';

  @override
  _JournalEntryFormState createState() => _JournalEntryFormState();
}

class _JournalEntryFormState extends State<JournalEntryForm> {
  final formKey = GlobalKey<FormState>();
  final journalEntry = JournalEntry();
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
            key: formKey,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              TextFormField(
                autofocus: true,
                decoration: InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(),
                ),
                onSaved: (value) {
                  journalEntry.title = value;
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter a title';
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState.validate()) {
                    formKey.currentState.save();

                    Navigator.of(context).pop();
                  }
                },
                child: Text('Save Entry'),
              )
            ])));
  }
}
