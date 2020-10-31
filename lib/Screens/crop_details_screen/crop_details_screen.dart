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
            buildRow("Method of sowing", "mut ke"),
            buildRow("Manure Application rate", "Go Green"),
            buildRow("Time of application of water", "Jab maan ho"),
            buildRow(
              "Time and method of application of nutrient",
              "Bola na",
            ),
            buildRow("Nutrient recommendation", "khud dhund"),
            buildRow("Weed management practice", "khud dhund"),
            buildRow("Intercultural operations if any", "khud dhund"),
            buildRow("Insect management", "khud dhund"),
            buildRow("Disease management", "khud dhund"),
            buildRow("Economic Yield", "khud dhund"),
            buildRow("Straw yield", "khud dhund"),
            buildRow("Cost of cultivation", "khud dhund"),
            buildRow("Net returns", "khud dhund"),
            buildRow("B:C ratio", "khud dhund"),
            buildRow("Source of availability of inputs", "khud dhund"),
            buildRow("Marketing source with price", "khud dhund"),
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
