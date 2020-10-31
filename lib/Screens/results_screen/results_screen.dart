import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kissan_mitra/Screens/crop_details_screen/crop_details_screen.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  "Existing Crops",
                  style: TextStyle(
                    fontSize: 50,
                    color: Colors.white,
                  ),
                ),
              ),
              ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                shrinkWrap: true,
                itemCount: 3,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => Card(
                  color: Colors.green[100],
                  elevation: 5,
                  child: ListTile(
                    title: Text(
                      "Crop $index",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  "Alternate Crops",
                  style: TextStyle(
                    fontSize: 50,
                    color: Colors.white,
                  ),
                ),
              ),
              ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                shrinkWrap: true,
                itemCount: 3,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => Card(
                  color: Colors.green[100],
                  elevation: 5,
                  child: ListTile(
                    onTap: () => Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (_) => CropDetailsScreen(
                          name: "Crop $index",
                        ),
                      ),
                    ),
                    title: Text(
                      "Crop $index",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
