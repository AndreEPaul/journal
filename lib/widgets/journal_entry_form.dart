import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:journal/models/journal_entry.dart';
import 'package:sqflite/sqflite.dart';

const DB_PATH = 'lib/assets/schema_1.sql.txt';

class JournalEntryForm extends StatefulWidget {
  static final routeName = 'form';

  @override
  _JournalEntryFormState createState() => _JournalEntryFormState();
}

class _JournalEntryFormState extends State<JournalEntryForm> {
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
                  entry.title = value;
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter a title';
                  } else {
                    return null;
                  }
                },
              ),
              TextFormField(
                autofocus: true,
                decoration: InputDecoration(
                  labelText: 'Body',
                  border: OutlineInputBorder(),
                ),
                onSaved: (value) {
                  entry.body = value;
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter a body';
                  } else {
                    return null;
                  }
                },
              ),
              TextFormField(
                autofocus: true,
                decoration: InputDecoration(
                  labelText: 'Rating',
                  border: OutlineInputBorder(),
                ),
                onSaved: (value) {
                  entry.rating = int.parse(value);
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter a rating (1-4)';
                  } else if (value != "1" &&
                      value != "2" &&
                      value != "3" &&
                      value != "4") {
                    return 'Rating must be 1-4';
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () async {
                  if (formKey.currentState.validate()) {
                    formKey.currentState.save();
                    String schema = await rootBundle.loadString(DB_PATH);
                    final Database db = await openDatabase('journal.db',
                        version: 1, onCreate: (Database db, int version) async {
                      await db.execute(schema);
                    });
                    await db.transaction(((txn) async {
                      insert(txn);
                    }));
                    await db.close();
                    Navigator.of(context).pop();
                  }
                },
                child: Text('Save Entry'),
              )
            ])));
  }

  final formKey = GlobalKey<FormState>();
  JournalEntry entry = JournalEntry(-1, '', '', -1, DateTime.now());

  Future insert(txn) async {
    await txn.rawInsert(
        'INSERT INTO journal_entries(title, body, rating, date) VALUES(?,?,?,?)',
        [entry.title, entry.body, entry.rating, entry.date]);
  }
}
