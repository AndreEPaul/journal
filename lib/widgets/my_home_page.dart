import 'package:flutter/material.dart';
import 'package:journal/widgets/welcome.dart';

const DB_PATH = "lib/assets/schema_1.sql.txt";

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  static final routeName = '/';
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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

  bool _showWelcomeWidget = true;

  void _toggleShowWelcomeWidget() {
    setState(() {
      _showWelcomeWidget = !_showWelcomeWidget;
    });
  }
}
