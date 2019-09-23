import 'package:flutter/material.dart';
import 'header.dart';
import '../widgets/input.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter Tutorial',
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
        body: SafeArea(
          child: Container(
            child: Column(children: [
              Expanded(
                  child: Container(
                padding: EdgeInsets.all(30),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Header(),
                      WelcomBack,
                      Name(
                        name: "Yadu CR",
                      ),
                      Input(
                        hint: "Email address",
                      ),
                      Input(
                        hint: "Email address",
                      ),
                      SocialAuth,
                    ]),
              )),
              LoginButton
            ]),
          ),
        ),
      ),
    );
  }
}

Widget LoginButton = Container(
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Container(
        padding: EdgeInsets.all(30),
        child: Text(
          "Forgot password?",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      Stack(
        alignment: const Alignment(0.75, -7.5),
        children: <Widget>[
          Container(
            color: Colors.grey[200],
            height: 80,
          ),
          ClipRRect(
            borderRadius: new BorderRadius.circular(16.0),
            child: Container(
              color: Colors.cyan[200],
              height: 70,
              width: 70,
              child: Icon(
                Icons.arrow_forward,
                size: 35,
                color: Colors.white,
              ),
            ),
          ),
        ],
      )
    ],
  ),
);

Widget SocialAuth = Container(
    margin: EdgeInsets.only(top: 30),
    child: Row(
      children: <Widget>[
        Container(
          child: Icon(
            MaterialCommunityIcons.facebook,
            size: 35,
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 15),
          child: Icon(
            MaterialCommunityIcons.google,
            size: 35,
          ),
        )
      ],
    ));

Widget WelcomBack = Container(
    margin: EdgeInsets.only(top: 50),
    child: Text("Welcome Back,",
        style: TextStyle(
          fontSize: 28,
        )));

class Name extends StatelessWidget {
  final String name;

  const Name({Key key, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        margin: EdgeInsets.only(top: 10),
        child: Text("${name}",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)));
    ;
  }
}
