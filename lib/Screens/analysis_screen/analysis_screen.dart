import 'dart:ui';

import 'package:flare_flutter/flare_controls.dart';
import 'package:flutter/material.dart';
import 'package:kissan_mitra/services/crop_suggest_api.dart';

import '../../localization/language_constants.dart';
import '../results_screen/results_screen.dart';
import 'widgets/background_farm.dart';
import '../../utils/get_it_init.dart';

class AnalysisScreen extends StatefulWidget {
  AnalysisScreen({Key key}) : super(key: key);

  @override
  _AnalysisScreenState createState() => _AnalysisScreenState();
}

class _AnalysisScreenState extends State<AnalysisScreen> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  int index = 0, size;

  FlareControls _controller;

  static const para = [
    "season",
    "area",
    "last_year",
    "depth",
    "energy"
  ];

  @override
  void initState() {
    super.initState();
    _controller = FlareControls();
    size = para.length;
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
              getTranslated(context,para[index]),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 40),
            ),
            Flexible(
              child: BackgroundFarm(
                index: index,
                size: size - 1,
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
                          onPressed: () async {
                            if (index < size - 1) {
                              setState(() {
                                index++;
                              });
                              _controller.play("forward");
                            } else {
                              final res =
                                  await locator<CropSuggestAPI>().getSuggestion(
                                [
                                  32,
                                  127,
                                  3,
                                  185.0,
                                  156.0,
                                  27.53,
                                  183.07,
                                  1188.54,
                                  105.57,
                                  10107.61111,
                                  12544.38889,
                                  2724.555556,
                                  1448.055556,
                                  1051.833333,
                                  5073.388889,
                                  22092.66667,
                                  0.0,
                                  0.0,
                                  0.0,
                                  710.3888889,
                                  0,
                                  0.5542,
                                  0.3393,
                                  0.0238,
                                  0.5298
                                ],
                              );

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => ResultsScreen(result: res),
                                ),
                              );
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
