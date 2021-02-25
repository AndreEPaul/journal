import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Icon(Icons.book_rounded),
      Text("Journal", style: Theme.of(context).textTheme.headline1),
    ]);
  }
}
