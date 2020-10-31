import 'dart:ui';

import 'package:flare_flutter/flare_controls.dart';
import 'package:flutter/material.dart';
import 'package:kissan_mitra/classes/language.dart';
import 'package:kissan_mitra/localization/language_constants.dart';

import '../../main.dart';
import 'widgets/background_farm.dart';

class AnalysisScreen extends StatefulWidget {
  AnalysisScreen({Key key}) : super(key: key);

  @override
  _AnalysisScreenState createState() => _AnalysisScreenState();
}

class _AnalysisScreenState extends State<AnalysisScreen> {
    final GlobalKey<FormState> _key = GlobalKey<FormState>();
    void _changeLanguage(Language language) async {
    Locale _locale = await setLocale(language.languageCode);
    App.setLocale(context, _locale);
    }
  int index = 0;

  FlareControls _controller;


  @override
  void initState() {
    super.initState();
    _controller = FlareControls();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: SafeArea(
        key: _key,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const SizedBox(height: 25),
            Text(
              getTranslated(context, "analysis"),
              style: TextStyle(color: Colors.white, fontSize: 60),
            ),
            Flexible(
              child: BackgroundFarm(
                index: index,
                controller: _controller,
              ),
            ),
            Container(
              color: const Color(0xFF72C08E),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Flexible(
                        child: IconButton(
                          color: Colors.white,
                          icon: Icon(Icons.arrow_back),
                          onPressed: () {
                            if (index > 0) {
                              setState(() {
                                index--;
                              });
                              _controller.play("reverse");
                            }
                          },
                        ),
                      ),
                      Flexible(
                        flex: 2,
                        child: TextField(
                          style: TextStyle(color: Colors.white, fontSize: 22),
                          cursorColor: Colors.white,
                        ),
                      ),
                      Flexible(
                        child: IconButton(
                          color: Colors.white,
                          icon: Icon(Icons.arrow_forward),
                          onPressed: () {
                            if (index < 7) {
                              setState(() {
                                index++;
                              });
                              _controller.play("forward");
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
