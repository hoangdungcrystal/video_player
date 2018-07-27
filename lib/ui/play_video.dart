import 'package:flutter/material.dart';

import 'home.dart';

class PlayVideoPage extends StatefulWidget {
  PlayVideoPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _PlayVideoPageState createState() => new _PlayVideoPageState();
}

class _PlayVideoPageState extends State<PlayVideoPage> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        elevation: 2.0,
        title: Text('Play video'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add, size: 30.0, color: Colors.white),
            onPressed: (){},
          )
        ],
      ),
      body: ListView(
        children: <Widget>[

        ],
      )
    );
  }
}