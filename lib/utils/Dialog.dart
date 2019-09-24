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
  dialog = showProgressDialog(context: context, loadingText: "Loading");
}

dismissProgress() {
  if (dialog != null) {
    dialog.dismiss(showAnim: true);
  }
}
