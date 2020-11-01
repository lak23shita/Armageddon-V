import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kissan_mitra/classes/language.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import '../../localization/language_constants.dart';
import '../../main.dart';
import '../../providers/auth_provider.dart';
import '../analysis_screen/analysis_screen.dart';
import 'weather.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    void _changeLanguage(Language language) async {
      Locale _locale = await setLocale(language.languageCode);
      App.setLocale(context, _locale);
    }

    return Scaffold(
      backgroundColor: mainBgColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Stack(
              alignment: AlignmentDirectional.topCenter,
              // ignore: deprecated_member_use
              overflow: Overflow.visible,
              children: <Widget>[
                _backBgCover(),
                _greetings(),
                Positioned(
                  top: 15,
                  right: 60,
                  child: DropdownButton<Language>(
                    underline: SizedBox(),
                    icon: Icon(
                      Icons.language,
                      color: Colors.white,
                    ),
                    onChanged: (Language language) {
                      _changeLanguage(language);
                    },
                    items: Language.languageList()
                        .map<DropdownMenuItem<Language>>(
                          (e) => DropdownMenuItem<Language>(
                            value: e,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[Text(e.name)],
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
                Positioned(
                  top: 15,
                  right: 0.9,
                  child: new IconButton(
                    icon: Icon(
                      Icons.exit_to_app,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Provider.of<AuthProvider>(context, listen: false)
                          .signOut();
                    },
                  ),
                ),
                // _moodsHolder(),
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    // _notificationCard(),
                    // _nextAppointmentText(),
                    _weatherCard(),
                    SizedBox(
                      height: 20.0,
                    ),
                    _appoinmentCard(),
                    _picture(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _backBgCover() {
    return Container(
      height: 260.0,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Colors.green[300], Colors.green],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
    );
  }

  Positioned _greetings() {
    return Positioned(
      left: 20,
      bottom: 90,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            getTranslated(context, "kissan_name"),
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }

  Widget _weatherCard() {
    return RaisedButton(
      color: Colors.green,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => WeatherApp()),
        );
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(200.0)),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: const Text(
          'Weather Report',
          style: TextStyle(
              fontWeight: FontWeight.w500, fontSize: 35, color: Colors.white),
        ),
      ),
    );
  }

  Widget _appoinmentCard() {
    return RaisedButton(
      color: Colors.green,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => AnalysisScreen()),
        );
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(200.0)),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: const Text(
          'Start Analysis',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 40,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Column iconBuilder(icon, title) {
    return Column(
      children: <Widget>[
        Icon(
          icon,
          size: 28,
          color: Colors.black,
        ),
        SizedBox(
          height: 8.0,
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w300,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  Widget _picture() {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 18.0),
      margin: EdgeInsets.only(
        bottom: 20.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SvgPicture.asset(
            "assets/icons/sprout.svg",
            height: size.height * 0.45,
          ),
        ],
      ),
    );
  }
}
