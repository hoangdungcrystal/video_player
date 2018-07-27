import 'package:flutter/material.dart';

import 'home.dart';
import '../model/video.dart';

class PlayListItemPage extends StatefulWidget {
  PlayListItemPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _PlayListItemPageState createState() => new _PlayListItemPageState();
}

class _PlayListItemPageState extends State<PlayListItemPage> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        elevation: 2.0,
        title: Text('Music'),
      ),
      body: ListVideos(kVideos),
    );
  }
}

class ListVideos extends StatelessWidget {
  static const int ADD_TO_PLAYLIST = 1;
  static const int DELETE_VIDEO = 2;
  final List<Video> _videos;

  ListVideos(this._videos);
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(top: 15.0),
      children: _videos.map((c) => Container(
        margin: EdgeInsets.only(bottom: 15.0),
        child: ListTile(
          contentPadding: EdgeInsets.only(top: 15.0, bottom: 15.0, left: 15.0),
          leading: Container(
            width: 130.0,
            height: 90.0,
            decoration: BoxDecoration(
              color: Colors.black38,
              border: Border.all(width: 1.0, color: Colors.grey[300]),
              borderRadius: BorderRadius.circular(3.0)
            ),
            child: MaterialButton(
              child: IconButton(
                icon: Icon(Icons.play_arrow),
              ),
              onPressed: (){},
            )
          ),
          title: Text(c.name),
          trailing: PopupMenuButton<int>(
            icon: Icon(Icons.more_vert, size: 30.0, color: Colors.grey[700]),
            itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[
              const PopupMenuItem<int>(
                value: ADD_TO_PLAYLIST,
                child: Text('Add to playlist'),
              ),
              const PopupMenuItem<int>(
                value: DELETE_VIDEO,
                child: Text('Delete from Library'),
              ),
            ],
          ),
          )
        ),
      ).toList(),
    );
  }
}