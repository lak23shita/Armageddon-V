import 'package:flutter/material.dart';

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
            buildRow("Area", "1000m"),
            buildRow("Seed Rate", "10"),
            buildRow("Spacing", "10m"),
            buildRow("Time of sowing/planting", "Kharif"),
            buildRow("Method of sowing", "Test"),
            buildRow("Manure Application rate", "Go Green"),
            buildRow("Time of application of water", "Test"),
            buildRow(
              "Time and method of application of nutrient",
              "Test",
            ),
            buildRow("Nutrient recommendation", "test"),
            buildRow("Weed management practice", "test"),
            buildRow("Intercultural operations if any", "test"),
            buildRow("Insect management", "test"),
            buildRow("Disease management", "test"),
            buildRow("Economic Yield", "test"),
            buildRow("Straw yield", "test"),
            buildRow("Cost of cultivation", "test"),
            buildRow("Net returns", "test"),
            buildRow("B:C ratio", "test"),
            buildRow("Source of availability of inputs", "test"),
            buildRow("Marketing source with price", "test"),
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
