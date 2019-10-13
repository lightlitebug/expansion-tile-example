import 'package:flutter/material.dart';

import 'package:expansion_video/pixabay_one_screen.dart';
import 'package:expansion_video/pixabay_two_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expansion Tile',
      theme: ThemeData(
        primarySwatch: Colors.red,
        accentColor: Colors.teal,
      ),
      home: ExpansionTileApp(),
    );
  }
}

class ExpansionTileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expansion Tile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text(
                'Example One',
                style: TextStyle(color: Colors.white),
              ),
              color: Theme.of(context).primaryColor,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return PixabayOneScreen();
                  }),
                );
              },
            ),
            RaisedButton(
              child: Text(
                'Example Two',
                style: TextStyle(color: Colors.white),
              ),
              color: Theme.of(context).accentColor,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return PixabayTwoScreen();
                  }),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
