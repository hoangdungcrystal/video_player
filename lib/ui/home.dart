import 'package:flutter/material.dart';
import '../model/video.dart';
import 'play_video.dart';
import 'playlist.dart';
import 'playlist_item.dart';
import 'create_playlist_dialog.dart';
import 'add_to_playlist.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  
  Widget changeTitleTab(){
    return Stack(
      children: <Widget>[
        Offstage(
          offstage: index != 0,
          child: TickerMode(
            enabled: index == 0,
            child: Text('All videos')
          ),
        ),
        Offstage(
          offstage: index != 1,
          child: TickerMode(
            enabled: index == 1,
            child: Text('Playlist')
          ),
        ),
      ],
    );
  }
  Widget changeTAction(){
    return Stack(
      children: <Widget>[
        Offstage(
          offstage: index != 0,
          child: TickerMode(
            enabled: index == 0,
            child: Text('')
          ),
        ),
        Offstage(
          offstage: index != 1,
          child: TickerMode(
            enabled: index == 1,
            child: IconButton(
              icon: Icon(Icons.add, size: 30.0,color: Colors.white),
              onPressed: () {
              showDialog(context: context, child: CreateNewPlaylist(),);
              }
            )
          ),
        ),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        elevation: 2.0,
        title: changeTitleTab(),
        actions: <Widget>[
          changeTAction(),
        ],
      ),
      body: new Stack(
        children: <Widget>[
          new Offstage(
            offstage: index != 0,
            child: new TickerMode(
              enabled: index == 0,
              child: AllVideosPage(kVideos)
            ),
          ),
          new Offstage(
            offstage: index != 1,
            child: new TickerMode(
              enabled: index == 1,
              child:PlaylistPage()
            ),
          ),
          new Offstage(
            offstage: index != 3,
            child: new TickerMode(
              enabled: index == 3,
              child:PlaylistPage()
            ),
          ),
        ],
      ),
      bottomNavigationBar: new BottomNavigationBar(
        currentIndex: index,
        onTap: (int index) { setState((){ this.index = index; }); },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library, size: 20.0,),
            title: Text(""),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.playlist_play),
            title: Text(""),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text(""),
          ),
        ],
      ),
    );
  }
}
class AllVideosPage extends StatelessWidget {
  static const int NEW_PLAYLIST = 1;
  static const int ADD_TO_PLAYLIST = 2;
  static const int DELETE_VIDEO = 3;
  final List<Video> _videos;

  AllVideosPage(this._videos);
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
                value: NEW_PLAYLIST,
                child: Text('New playlist'),
              ),
              const PopupMenuItem<int>(
                value: ADD_TO_PLAYLIST,
                child: Text('Add to playlist'),
              ),
              const PopupMenuItem<int>(
                value: DELETE_VIDEO,
                child: Text('Delete from Library'),
              ),
            ],
            onSelected: (menuId) =>
              _onPopupMenuButtonItemSelected(context, menuId),
          ),
        )
        ),
      ).toList(),
    );
  }

  void _onPopupMenuButtonItemSelected(BuildContext context, int menuId) {
    switch (menuId) {
      case NEW_PLAYLIST:
         showDialog(context: context, child: CreateNewPlaylist(),);
        break;
      case ADD_TO_PLAYLIST:
         Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PlaylistPageSelect()),
        );
        break;
      case DELETE_VIDEO:
        break;
      default:
        break;
    }
  }

}

