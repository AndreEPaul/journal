import 'package:flutter/material.dart';
import 'widgets/welcome.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _showWelcomeWidget = true;

  void _toggleShowWelcomeWidget() {
    setState(() {
      _showWelcomeWidget = !_showWelcomeWidget;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _showWelcomeWidget ? Welcome() : Container(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggleShowWelcomeWidget,
        tooltip: 'Add Journal Entry',
        child: Icon(Icons.add),
      ),
    );
  }
}
