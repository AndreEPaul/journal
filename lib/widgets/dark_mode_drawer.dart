import 'package:flutter/material.dart';
import 'package:dynamic_theme/dynamic_theme.dart';

class DarkModeDrawer extends StatefulWidget {
  @override
  _DarkModeDrawerState createState() => _DarkModeDrawerState();
}

class _DarkModeDrawerState extends State<DarkModeDrawer> {
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(padding: EdgeInsets.zero, children: <Widget>[
      DrawerHeader(
        child: Text('Settings'),
        decoration: BoxDecoration(
          color: Colors.purple,
        ),
      ),
      SwitchListTile(
        title: Text('Dark Mode'),
        value: _getIsDark(),
        onChanged: (value) {
          setState(() {
            toggleDarkMode();
          });
        },
      )
    ]));
  }

  bool _isDark = false;

  bool _getIsDark() {
    if (DynamicTheme.of(context).brightness == Brightness.dark) {
      _isDark = true;
    } else {
      _isDark = false;
    }
    return _isDark;
  }

  void toggleDarkMode() {
    DynamicTheme.of(context).setBrightness(
        Theme.of(context).brightness == Brightness.dark
            ? Brightness.light
            : Brightness.dark);
    if (DynamicTheme.of(context).brightness == Brightness.dark) {
      _isDark = true;
    } else {
      _isDark = false;
    }
  }
}
