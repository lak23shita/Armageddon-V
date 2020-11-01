import 'package:flutter/material.dart';

import '../localization/language_constants.dart';

class AlreadyHaveAnAccountCheck extends StatefulWidget {
  final bool login;
  final Function press;
  const AlreadyHaveAnAccountCheck({
    Key key,
    this.login = true,
    this.press,
  }) : super(key: key);

  @override
  _AlreadyHaveAnAccountCheckState createState() =>
      _AlreadyHaveAnAccountCheckState();
}

class _AlreadyHaveAnAccountCheckState extends State<AlreadyHaveAnAccountCheck> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          widget.login
              ? getTranslated(context, "already")
              : getTranslated(context, "account"),
          style: TextStyle(color: Colors.white),
        ),
        GestureDetector(
          onTap: widget.press,
          child: Text(
            widget.login
                ? getTranslated(context, "sign__up")
                : getTranslated(context, "sign_in"),
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
