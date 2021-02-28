import 'package:flutter/material.dart';
import 'package:journal/widgets/journal_entry_form.dart';
import 'package:journal/widgets/journal_entry_view.dart';
import 'package:journal/widgets/my_home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  static final routes = {
    MyHomePage.routeName: (context) => MyHomePage(),
    JournalEntryView.routeName: (context) => JournalEntryView(),
    JournalEntryForm.routeName: (context) => JournalEntryForm(),
  };

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Journal App',
      theme: ThemeData(primaryColor: Colors.purple, accentColor: Colors.grey),
      routes: MyApp.routes,
    );
  }
}
