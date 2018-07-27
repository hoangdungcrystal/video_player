import 'package:flutter/material.dart';

import '../model/playlist.dart';

class PlaylistPageSelect extends StatefulWidget {
  PlaylistPageSelect({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _PlaylistPageSelectState createState() => new _PlaylistPageSelectState();
}

class _PlaylistPageSelectState extends State<PlaylistPageSelect> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2.0,
        title: Text('Select Playlist'),
      ),
      body: AddToPlaylist(kPlaylist),
    );
  }
}

class AddToPlaylist extends StatelessWidget{

 final List<Playlist> _playlist;
  AddToPlaylist(this._playlist);

  @override
  Widget build(BuildContext context) {
   return ListView(
        children: _playlist.map((c) => Container(
        margin: EdgeInsets.only(bottom: 15.0),
        child: CheckboxListTile(
          value: true,
          secondary: IconButton(
            icon: Icon(Icons.playlist_play),
          ),
          title: Text(c.name,style: TextStyle(color: Colors.grey[900]),),
        )
        ),
         ).toList(),
      );
  }
}