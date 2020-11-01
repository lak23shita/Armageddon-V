import 'dart:ui';

import 'package:flare_flutter/flare_controls.dart';
import 'package:flutter/material.dart';
import 'package:kissan_mitra/enums/input_enum.dart';
import 'package:kissan_mitra/services/data_modifier.dart';

import '../../constants.dart';
import '../../services/crop_suggest_api.dart';
import '../../utils/get_it_init.dart';
import '../../utils/mapping.dart';
import '../results_screen/results_screen.dart';
import 'widgets/background_farm.dart';

class AnalysisScreen extends StatefulWidget {
  AnalysisScreen({Key key}) : super(key: key);

  @override
  _AnalysisScreenState createState() => _AnalysisScreenState();
}

class _AnalysisScreenState extends State<AnalysisScreen> {
  int index = 0, _carIndex = 0, size;
  Map<InputEnum, dynamic> result = {};
  String _season = SEASONS[0];
  String _energy = ENERGY_SOURCE[0];
  String _prevKharif, _prevRabi, _prevSummer;
  double _slider = 0;
  List<String> _crops = [], _oldCrops = List.filled(3, "Arecanut");

  TextEditingController _areaController = TextEditingController();
  TextEditingController _prodController = TextEditingController();

  FlareControls _controller;

  static const para = [
    "Season",
    "Area(Hectare)",
    "Last Year production(Ton)",
    "Depth of tubewell(Metre)",
    "Energy source",
    "Last Kharif crop",
    "Last Rabi crop",
    "Last Summer crop",
  ];

  @override
  void initState() {
    super.initState();
    _controller = FlareControls();
    size = para.length;
    setCrops();
    setDefault();
  }

  setCrops() async {
    _crops = locator<Mapping>().crops;
    _prevKharif = _prevRabi = _prevSummer = _crops[0];
  }

  void setDefault() {
    result[InputEnum.season] = 0;
    result[InputEnum.area] = 0;
    result[InputEnum.production] = 0;
    result[InputEnum.depthOftubeWell] = 0;
    result[InputEnum.energySource] = 0;
    result[InputEnum.kharifCrop] = 0;
    result[InputEnum.rabiCrop] = 0;
    result[InputEnum.summerCrop] = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Positioned.fill(
              child: BackgroundFarm(
                index: _carIndex,
                size: size - 1,
                controller: _controller,
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text(
                  para[index],
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 40),
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 0,
              height: 100,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Flexible(
                    fit: FlexFit.loose,
                    child: IconButton(
                      color: Colors.white,
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        if (index > 0) {
                          setState(() {
                            index--;
                            _carIndex--;
                          });
                          _controller.play("reverse");
                        }
                        if (_carIndex > size) {
                          setState(() {
                            _carIndex = size - 2;
                          });
                        }
                      },
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    fit: FlexFit.loose,
                    child: getWidget(),
                  ),
                  Flexible(
                    fit: FlexFit.loose,
                    child: IconButton(
                      color: Colors.white,
                      icon: Icon(Icons.arrow_forward),
                      onPressed: () async {
                        if (index < size - 1) {
                          setState(() {
                            index++;
                            _carIndex++;
                          });
                          _controller.play("forward");
                        } else {
                          await calculateResultNPush(context);
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future calculateResultNPush(BuildContext context) async {
    setState(() {
      _carIndex = size + 8;
    });
    _controller.play("forward");
    final res = await locator<CropSuggestAPI>().getSuggestion(
      await locator<DataModifier>().getParameters(result),
    );

    final topCrop = locator<DataModifier>().getTopResult(res, _oldCrops);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ResultsScreen(
          result: topCrop,
          oldCrops: _oldCrops,
        ),
      ),
    );
  }

  Widget getWidget() {
    switch (InputEnum.values[index]) {
      case InputEnum.season:
        return _seasonSelector();
      case InputEnum.area:
        return _areaSelector();
      case InputEnum.production:
        return _prodSelector();
      case InputEnum.depthOftubeWell:
        return _depthOfTubeWell();
      case InputEnum.energySource:
        return _energySource();
      case InputEnum.kharifCrop:
        return _lastCrop(5, _prevKharif, (value) {
          _prevKharif = value;
          _oldCrops[0] = value;
        });
      case InputEnum.rabiCrop:
        return _lastCrop(6, _prevRabi, (value) {
          _prevRabi = value;
          _oldCrops[1] = value;
        });
      case InputEnum.summerCrop:
        return _lastCrop(7, _prevSummer, (value) {
          _prevSummer = value;
          _oldCrops[2] = value;
        });
      default:
        return Container();
    }
  }

  Widget _seasonSelector() {
    return DropdownButton(
      value: _season,
      style: TextStyle(color: Colors.white, fontSize: 20),
      dropdownColor: Colors.green[300],
      items: SEASONS
          .map(
            (e) => DropdownMenuItem(
              value: e,
              child: Text(e),
            ),
          )
          .toList(),
      onChanged: (value) {
        setState(() {
          _season = value;
        });
        result[InputEnum.season] = SEASONS.indexOf(value);
      },
    );
  }

  Widget _areaSelector() => textField(ValueKey("area"), 1, _areaController);

  Widget _prodSelector() =>
      textField(ValueKey("production"), 2, _prodController);

  Widget _depthOfTubeWell() {
    return Slider(
      value: _slider,
      min: 0,
      max: 3,
      divisions: 3,
      activeColor: Colors.white,
      inactiveColor: Colors.white54,
      label: ["20-40", "40-60", "60-70", "70+"].elementAt(_slider.round()),
      onChanged: (double value) {
        setState(() {
          _slider = value;
          result[InputEnum.depthOftubeWell] = value.round();
        });
      },
    );
  }

  Widget _energySource() {
    return DropdownButton(
      value: _energy,
      style: TextStyle(color: Colors.white, fontSize: 20),
      dropdownColor: Colors.green[300],
      items: ENERGY_SOURCE
          .map(
            (e) => DropdownMenuItem(
              value: e,
              child: Text(e),
            ),
          )
          .toList(),
      onChanged: (value) {
        setState(() {
          _energy = value;
        });
        result[InputEnum.energySource] = ENERGY_SOURCE.indexOf(value);
      },
    );
  }

  Widget _lastCrop(int index, String value, Function(String) onChange) {
    return DropdownButton(
      value: value,
      style: TextStyle(color: Colors.white, fontSize: 20),
      dropdownColor: Colors.green[300],
      isExpanded: true,
      items: _crops
          .map(
            (e) => DropdownMenuItem(
              value: e,
              child: Text(e),
            ),
          )
          .toList(),
      onChanged: (onChangedVal) {
        setState(() {
          result[InputEnum.values[index]] = _crops.indexOf(onChangedVal);
          onChange(onChangedVal);
        });
      },
    );
  }

  TextField textField(Key key, int index, TextEditingController controller) {
    var underlineInputBorder = UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
    );
    return TextField(
      key: key,
      keyboardType: TextInputType.number,
      controller: controller,
      cursorColor: Colors.white,
      style: TextStyle(color: Colors.white, fontSize: 20),
      decoration: InputDecoration(
        hintText: "Enter value",
        enabledBorder: underlineInputBorder,
        focusedBorder: underlineInputBorder,
      ),
      onChanged: (value) {
        result[InputEnum.values[index]] = double.parse(value);
      },
    );
  }
}
