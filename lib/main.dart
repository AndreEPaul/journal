import 'package:flutter/material.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
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
    return DynamicTheme(
        defaultBrightness: Brightness.light,
        data: (brightness) => ThemeData(
              primarySwatch: Colors.purple,
              brightness: brightness,
            ),
        themedWidgetBuilder: (context, theme) {
          return MaterialApp(
            title: 'Journal App',
            theme: theme,
            routes: MyApp.routes,
          );
        });
  }
}
