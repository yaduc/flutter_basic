import 'package:flutter/material.dart';
import 'header.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:flutter/foundation.dart';

import '../widgets/input.dart';
import '../services/APIManager.dart';
import '../model/LoginResponse.dart';
import '../utils/Dialog.dart';

class Home extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  login(context) {
    showProgress(context);
    Future<LoginResponse> response =
        doLogin(emailController.text, passwordController.text);
    response.then((res) {
      dismissProgress();
      if (res.error != null) {
        showMessage(context, "Error", res.error.error);
      }
    }).catchError((error) {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
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
                        controller: emailController,
                      ),
                      Input(
                        hint: "Email address",
                        controller: passwordController,
                      ),
                      SocialAuth,
                    ]),
              )),
              LoginButton(login: login)
            ]),
          ),
        ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  final Function login;

  LoginButton({Key key, this.login});

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Container(
            height: 120,
            child: Stack(
              children: <Widget>[
                new Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      color: Colors.grey[200],
                      height: 80,
                    )),
                new Align(
                  alignment: const Alignment(0.85, -0.75),
                  child: InkWell(
                    onTap: () => login(context),
                    child: ClipRRect(
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
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

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
    margin: EdgeInsets.only(top: 35),
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
