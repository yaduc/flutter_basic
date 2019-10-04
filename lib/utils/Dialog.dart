import 'package:flutter/material.dart';
import 'package:flutter_progress_dialog/flutter_progress_dialog.dart';

showMessage(context, title, message) {
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context, rootNavigator: true).pop();
    },
  );

  AlertDialog alert = AlertDialog(
    title: Text(title),
    content: Text(message),
    actions: [
      okButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

var dialog;

showProgress(context) {
  //dialog = showProgressDialog(context: context, loadingText: "Loading");
  AlertDialog alert = AlertDialog(
    content: Container(
      child: Row(
        children: <Widget>[
          CircularProgressIndicator(
              backgroundColor: Colors.cyan[400],
              valueColor: AlwaysStoppedAnimation(Colors.cyan[600])),
          Container(
            margin: EdgeInsets.only(left: 20),
            child: Text("Loading...", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
          )
        ],
      ),
    ),
  );
  dialog = showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return WillPopScope(
          onWillPop: () {},
        child: alert,
      );
    },
  );
}

dismissProgress(context) {
  if (dialog != null) {
    Navigator.of(context, rootNavigator: true).pop();
  }
}
