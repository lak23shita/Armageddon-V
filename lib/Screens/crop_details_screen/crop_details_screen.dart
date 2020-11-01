import 'package:flutter/material.dart';
import 'package:kissan_mitra/localization/language_constants.dart';

class CropDetailsScreen extends StatelessWidget {
  const CropDetailsScreen({Key key, this.name}) : super(key: key);
  final String name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(15.0),
          children: <Widget>[
            Text(
              name,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 50,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 15),
            buildRow(getTranslated(context, "area"), "1000m"),
            buildRow(getTranslated(context, "seed_rate"), "10"),
            buildRow(getTranslated(context, "spacing"), "10m"),
            buildRow(getTranslated(context, "time"), "Kharif"),
            buildRow(getTranslated(context, "method"), "Test"),
            buildRow(getTranslated(context, "manure"), "Go Green"),
            buildRow(getTranslated(context, "time_water"), "Test"),
            buildRow(
              getTranslated(context, "time_method"),
              "Test",
            ),
            buildRow(getTranslated(context, "nutrient"), "test"),
            buildRow(getTranslated(context, "weed"), "test"),
            buildRow(getTranslated(context, "operations"), "test"),
            buildRow(getTranslated(context, "insect"), "test"),
            buildRow(getTranslated(context, "disease_management"), "test"),
            buildRow(getTranslated(context, "economic"), "test"),
            buildRow(getTranslated(context, "straw"), "test"),
            buildRow(getTranslated(context, "cost_cul"), "test"),
            buildRow(getTranslated(context, "net"), "test"),
            buildRow(getTranslated(context, "ratio"), "test"),
            buildRow(getTranslated(context, "availability"), "test"),
            buildRow(getTranslated(context, "market"), "test"),
          ],
        ),
      ),
    );
  }

  Column buildRow(String para, String res) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            para,
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            res,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
        Divider(
          thickness: 1,
          color: Colors.white,
        )
      ],
    );
  }
}
