import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:kissan_mitra/classes/language.dart';
import 'package:kissan_mitra/localization/language_constants.dart';
import 'package:kissan_mitra/main.dart';

import '../../constants.dart';
import '../onboarding_screen.dart';

class Languagepage extends StatefulWidget{
  Languagepage({Key key}) : super(key:key);

  @override
  _LanguagepageState createState() =>_LanguagepageState();

}
class _LanguagepageState extends State<Languagepage> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  void _changeLanguage(Language language) async {
    Locale _locale = await setLocale(language.languageCode);
    App.setLocale(context, _locale);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(

      body: Column(
        key: _key,
        mainAxisAlignment: MainAxisAlignment.center,
        children:<Widget>[
          Text(
            getTranslated(context, "welcome"),
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
          ),
          SizedBox(height: size.height * 0.05),
          SvgPicture.asset(
            "assets/images/farmer.svg",
            height: size.height * 0.45,
          ),
          SizedBox(height: size.height * 0.05),
          Container(
            child: Center(
                child: DropdownButton<Language>(
                  iconSize: 30,
                  hint: Text(getTranslated(context, 'change_language')),
                  onChanged: (Language language) {
                    _changeLanguage(language);
                  },
                  items: Language.languageList()
                      .map<DropdownMenuItem<Language>>(
                        (e) => DropdownMenuItem<Language>(
                      value: e,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[

                          Text(e.name)
                        ],
                      ),
                    ),
                  )
                      .toList(),
                ),
            ),

          ),
           RaisedButton(
              child: Text(getTranslated(context, "on_bording")),
              color:  kPrimaryLightColor,
              onPressed:(){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OnBoardingPage()),
                );
              },
            ),
        ],
      ),

    );
  }
}
