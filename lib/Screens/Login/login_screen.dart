import 'package:flutter/material.dart';
import 'package:kissan_mitra/classes/language.dart';
import 'package:kissan_mitra/localization/language_constants.dart';
import 'package:kissan_mitra/main.dart';
import 'components/body.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  void _changeLanguage(Language language) async {
    Locale _locale = await setLocale(language.languageCode);
    App.setLocale(context, _locale);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Body(),
    );
  }
}


