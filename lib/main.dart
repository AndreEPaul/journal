import 'package:flutter/material.dart';
import 'package:journal/widgets/journal_entry_form.dart';
import 'package:journal/widgets/my_home_page.dart';
import 'package:journal/widgets/journal_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  static final routes = {
    MyHomePage.routeName: (context) => MyHomePage(),
    JournalView.routeName: (context) => JournalView(),
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
      // took this theme from flutter docs
      theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.purple,
          accentColor: Colors.grey,
          fontFamily: 'Georgia',
          textTheme: TextTheme(
            headline1: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            headline2: TextStyle(fontSize: 18.0, fontStyle: FontStyle.italic),
            bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
          )),
      home: MyHomePage(title: 'Journal'),
    );
  }
}
