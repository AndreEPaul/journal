import 'dart:core';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:journal/models/journal.dart';
import 'package:journal/models/journal_entry.dart';
import 'package:journal/widgets/dark_mode_drawer.dart';

import 'package:journal/widgets/welcome.dart';
import 'package:journal/widgets/journal_entry_form.dart';
import 'package:journal/widgets/journal_entry_view.dart';

import 'package:sqflite/sqflite.dart';

const DB_PATH = "lib/assets/schema_1.sql.txt";

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  static final routeName = '/';
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Journal journal = Journal();

  @override
  Widget build(BuildContext context) {
    if (journal.isEmpty()) {
      return Welcome();
    } else {
      return Scaffold(
        endDrawer: DarkModeDrawer(),
        appBar: AppBar(title: Text('Journal')),
        body: journalList(journal),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            showForm(context);
          },
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    getJournal();
  }

  void getJournal() async {
    String schema = await rootBundle.loadString(DB_PATH);
    final Database db = await openDatabase('journal.db', version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(schema);
    });
    List<Map> currentJournal = await loadJournalFromDB(db);
    final entries = currentJournal.map((entry) {
      return JournalEntry(entry['id'], entry['title'], entry['body'],
          entry['rating'], DateTime.parse(entry['date']));
    }).toList();
    setState(() {
      journal = Journal(entries);
    });
  }

  void showForm(BuildContext context) {
    Navigator.pushNamed(context, JournalEntryForm.routeName);
  }

  Future<List<Map>> loadJournalFromDB(db) async {
    List<Map> dbResult = await db.rawQuery('SELECT * FROM journal_entries');
    return dbResult;
  }

  Widget journalList(Journal journal) {
    const _padding = EdgeInsets.all(5);
    getJournal();
    return ListView.builder(
      padding: _padding,
      itemCount: journal.entries.length,
      itemBuilder: (BuildContext context, int idx) {
        return ListTile(
          title: Text(journal.entries[idx].title),
          subtitle: Text((journal.entries[idx].date).toString()),
          onTap: () {
            showEntry(context, journal, idx);
          },
        );
      },
    );
  }

  void showEntry(BuildContext context, Journal journal, int idx) {
    Navigator.pushNamed(context, JournalEntryView.routeName,
        arguments: {journal, idx});
  }
}
