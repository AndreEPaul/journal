import 'package:flutter/material.dart';
import 'package:journal/models/journal.dart';
import 'package:journal/widgets/dark_mode_drawer.dart';
import 'package:journal/models/journal_entry.dart';

class JournalEntryView extends StatelessWidget {
  static final routeName = 'entry';

  @override
  Widget build(BuildContext context) {
    final Journal journal = ModalRoute.of(context).settings.arguments;
    final int idx = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        endDrawer: DarkModeDrawer(),
        appBar: AppBar(
          title: Text((journal.entries[idx].date).toString()),
        ),
        body: details(context, journal.entries[idx]));
  }
}

Container details(BuildContext context, JournalEntry entry) {
  return Container(
      child: ListTile(
    title: Text(entry.title),
    subtitle: Row(children: <Widget>[
      Text(
        entry.body,
        textAlign: TextAlign.left,
      ),
      Spacer(),
      Text(
        'Rating: ' + entry.rating.toString(),
        textAlign: TextAlign.right,
      )
    ]),
  ));
}
