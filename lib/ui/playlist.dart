import 'package:flutter/material.dart';

import '../model/playlist.dart';
import 'playlist_item.dart';

class PlaylistPage extends StatefulWidget {
  PlaylistPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _PlaylistPageState createState() => new _PlaylistPageState();
}

class _PlaylistPageState extends State<PlaylistPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PlaylistSelect(kPlaylist),
    );
  }
}

class PlaylistSelect extends StatelessWidget{
  final List<Playlist> _playlist;
  PlaylistSelect(this._playlist);

  @override
  Widget build(BuildContext context) {
   return ListView(
        children: _playlist.map((c) => Container(
        margin: EdgeInsets.only(bottom: 15.0),
        child: ListTile(
          contentPadding: EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
          leading: IconButton(
            icon: Icon(Icons.playlist_play),
          ),
          title: Text(c.name),
          trailing: IconButton(
            icon: Icon(Icons.chevron_right, size: 30.0,),
          ),
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PlayListItemPage()),
            );
          },
          onLongPress: (){
            showModalBottomSheet<void>(context: context, builder: (BuildContext context) {
              return SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    ListTile(
                      title: Text('Add to playlist'),
                      trailing: IconButton(
                        icon: Icon(Icons.playlist_add),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(border: Border(top: BorderSide(width: 1.0, color: Colors.grey[300]))),
                      child: ListTile(
                      title: Material(
                        borderRadius: BorderRadius.circular(4.0),
                        shadowColor: Color(0xFF3580ED),
                        elevation: 0.0,
                        child: MaterialButton(
                          minWidth: 200.0,
                          height: 44.0,
                          child: Text('DELETE',
                            style: TextStyle(
                              color: Colors.redAccent[700],
                              fontWeight: FontWeight.bold,
                              fontSize: 14.0)),
                          onPressed: (){
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                    )
                  ])
              );
            });
          },
        )
        ),
         ).toList(),
      );
  }
}