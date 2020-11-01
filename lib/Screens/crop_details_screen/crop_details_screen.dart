import 'package:flutter/material.dart';

import '../../classes/crop_details/crop_details.dart';
import '../../utils/get_it_init.dart';
import '../../utils/mapping.dart';

class CropDetailsScreen extends StatelessWidget {
  CropDetailsScreen({Key key, this.name}) : super(key: key);
  final String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: locator<Mapping>().getCropData(name),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else if (snapshot.hasData) {
              final CropDetails model = snapshot.data;
              return ListView(
                padding: const EdgeInsets.all(15.0),
                children: <Widget>[
                  Text(
                    model.name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 50,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 15),
                  buildRow("Area", model.area),
                  buildRow("Seed Rate", model.seedRate),
                  buildRow("Spacing", model.spacing),
                  buildRow("Time of sowing/planting", model.timeOfSowing),
                  buildRow("Method of sowing", model.methodOfSowing),
                  buildRow("Time of application of water", model.timeOfWater),
                  buildRow(
                    "Nutrient recommendation",
                    model.nutrientRecommendation,
                  ),
                  buildRow("Weed management practice", model.weedManagement),
                  buildRow("Insect management", model.insectManagement),
                  buildRow("Disease management", model.diseaseManagement),
                  buildRow("Straw yield", model.strawYield),
                ],
              );
            }
            return Center(child: CircularProgressIndicator());
          },
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
            textAlign: TextAlign.justify,
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
