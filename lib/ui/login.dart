import 'package:flutter/material.dart';

import 'home.dart';
class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Login'),
      ),
      body: new ListView(
        padding: EdgeInsets.fromLTRB(15.0, 30.0, 15.0, 5.0),
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 15.0),
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
                  icon: Icon(Icons.email, size: 20.0),
                  contentPadding: new EdgeInsets.fromLTRB(8.0, 10.0, 8.0, 8.0),
                  hintText: 'Enter your email',
                  border: InputBorder.none,
                  hintStyle: TextStyle(fontSize: 14.0),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 20.0),
              padding: EdgeInsets.only(left: 15.0),
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
                  icon: Icon(Icons.lock, size: 20.0),
                  contentPadding: new EdgeInsets.fromLTRB(8.0, 10.0, 8.0, 8.0),
                  hintText: 'Password',
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
                  child: Text('LOGIN ',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0)),
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                ),
              ),
            ),
          ],
      ),
    );
  }
}
