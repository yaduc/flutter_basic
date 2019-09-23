import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ClipRRect(
          borderRadius: new BorderRadius.circular(16.0),
          child: Icon(Ionicons.logo_chrome, size: 32,)
//          Image.asset(
//            'lib/images/lake.jpg',
//            fit: BoxFit.cover,
//            height: 60,
//            width: 60,
//          ),
        ),
        Row(
          children: <Widget>[
            SignButton(
              label: "Sign In",
            ),
            SignButton(label: "Sign Up"),
          ],
        ),
      ],
    );
  }
}

class SignButton extends StatelessWidget {
  final String label;

  const SignButton({Key key, this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
            color: Colors.black,
            height: 1,
            width: 50,
            margin: EdgeInsets.only(top: 10),
          )
        ],
      ),
    );
  }
}
