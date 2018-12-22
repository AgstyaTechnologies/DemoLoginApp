import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new LoginState();
  }
}

class LoginState extends State<Login> {
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();

  String _strWelcome = "";

  void _erase() {
    setState(() {
      _emailController.clear();
      _passwordController.clear();
    });
  }

  void _showWelcomMessage() {
    setState(() {
      if (_emailController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty) {
        _strWelcome = _emailController.text;
      } else {
        _strWelcome = "Nothing!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Login"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      backgroundColor: Colors.blueGrey,
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          children: <Widget>[
            new Image.asset(
              'images/face.png',
              width: 90.0,
              height: 90.0,
              color: Colors.lightGreen,
            ),

            // Form
            new Container(
                height: 180.0,
                width: 360.0,
                color: Colors.white,
                child: new Column(
                  children: <Widget>[
                    new TextField(
                      controller: _emailController,
                      decoration: new InputDecoration(
                          hintText: 'Username', icon: new Icon(Icons.person)),
                    ), // Username
                    new TextField(
                      controller: _passwordController,
                      decoration: new InputDecoration(
                          hintText: 'Password', icon: new Icon(Icons.lock)),
                      obscureText: true,
                    ), // Password
                    new Padding(padding: new EdgeInsets.all(11.0)),
                    new Center(
                        child: new Row(
                      children: <Widget>[
                        new Container(
                          margin: const EdgeInsets.only(left: 38.0),
                          child: new RaisedButton(
                            onPressed: _showWelcomMessage,
                            color: Colors.redAccent,
                            child: new Text(
                              "Login",
                              style: new TextStyle(
                                  color: Colors.white, fontSize: 17.0),
                            ),
                          ),
                        ),
                        new Container(
                          margin: const EdgeInsets.only(left: 120.0),
                          child: new RaisedButton(
                            onPressed: _erase,
                            color: Colors.redAccent,
                            child: new Text(
                              "Clear",
                              style: new TextStyle(
                                  color: Colors.white, fontSize: 17.0),
                            ),
                          ),
                        )
                      ],
                    )),
                  ],
                )),
            new Padding(
              padding: new EdgeInsets.all(14.0),
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(
                  "Welcome, $_strWelcome",
                  style: new TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
