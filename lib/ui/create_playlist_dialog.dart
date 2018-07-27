import 'package:flutter/material.dart';

import '../model/playlist.dart';
import 'playlist_item.dart';

class CreateNewPlaylist extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
  return AlertDialog(
      title: Text("New playlist"),
      content: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 15.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                border: Border.all(width: 1.0, color: Colors.grey),
              ),
              height: 40.0,
              child: new TextFormField(
                autofocus: false,
                style: TextStyle(
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  contentPadding: new EdgeInsets.fromLTRB(8.0, 10.0, 8.0, 8.0),
                  hintText: 'Enter playlist name',
                  border: InputBorder.none,
                  hintStyle: TextStyle(fontSize: 14.0),
                ),
              ),
            ),
            Container(
              child: Material(
                borderRadius: BorderRadius.circular(4.0),
                shadowColor: Color(0xFF3580ED),
                elevation: 5.0,
                child: MaterialButton(
                  minWidth: 200.0,
                  height: 44.0,
                  color: Color(0xFF3580ED),
                  child: Text('CREATE',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0)),
                  onPressed: (){
                  },
                ),
              ),
            ),
          ],
        )
      ),
    );
  }
}