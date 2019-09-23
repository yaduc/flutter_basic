import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

enum SELECTED_INDEX { signIn, signUp }

class Header extends StatefulWidget {
  @override
  _HeaderState createState() {
    return _HeaderState();
  }
}

class _HeaderState extends State<Header> {
  SELECTED_INDEX _selectedButton = SELECTED_INDEX.signIn;

  void updateSelected(index) {
    setState(() {
      _selectedButton = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ClipRRect(
            borderRadius: new BorderRadius.circular(16.0),
            child: Icon(
              Ionicons.logo_chrome,
              size: 32,
            )),
        Row(
          children: <Widget>[
            SignButton(
                label: "Sign In",
                showDivider: this._selectedButton == SELECTED_INDEX.signIn,
                updateSelected: updateSelected, tag: SELECTED_INDEX.signIn),
            SignButton(
                label: "Sign Up",
                showDivider: this._selectedButton == SELECTED_INDEX.signUp,
                updateSelected: updateSelected, tag: SELECTED_INDEX.signUp),
          ],
        ),
      ],
    );
  }
}

class SignButton extends StatelessWidget {
  final String label;
  final bool showDivider;
  final Function updateSelected;
  final SELECTED_INDEX tag;

  const SignButton(
      {Key key, this.label, this.showDivider, this.updateSelected, this.tag})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
      {
        updateSelected(this.tag)
      },
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        child: Column(
//        mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '${this.label}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Container(
              color: this.showDivider ? Colors.black : null,
              height: 1,
              width: 50,
              margin: EdgeInsets.only(top: 10),
            )
          ],
        ),
      ),
    );
  }
}
