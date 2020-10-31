import 'package:flutter/material.dart';
import 'package:kissan_mitra/classes/language.dart';
import 'package:kissan_mitra/localization/language_constants.dart';

import '../main.dart';

class AlreadyHaveAnAccountCheck extends StatefulWidget {
  final bool login;
  final Function press;
  const AlreadyHaveAnAccountCheck({
    Key key,
    this.login = true,
    this.press,
  }) : super(key: key);

  @override
  _AlreadyHaveAnAccountCheckState createState() => _AlreadyHaveAnAccountCheckState();
}

class _AlreadyHaveAnAccountCheckState extends State<AlreadyHaveAnAccountCheck> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  void _changeLanguage(Language language) async {
    Locale _locale = await setLocale(language.languageCode);
    App.setLocale(context, _locale);
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          widget.login ?getTranslated(context, "already") :getTranslated(context, "account") ,
          style: TextStyle(color: Colors.white),
        ),
        GestureDetector(
          onTap: widget.press,
          child: Text(
            widget.login ?getTranslated(context, "sign__up") : getTranslated(context, "sign_in"),
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
