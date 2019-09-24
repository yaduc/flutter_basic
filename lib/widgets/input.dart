import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final String hint;
  final TextEditingController controller;

  const Input({Key key, this.hint, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        margin: EdgeInsets.only(top: 10),
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
              labelText: this.hint,
              labelStyle: TextStyle(color: Colors.grey),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              )),
        ));
  }
}
