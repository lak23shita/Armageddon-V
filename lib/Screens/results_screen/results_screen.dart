import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../crop_details_screen/crop_details_screen.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({Key key, this.result, this.oldCrops}) : super(key: key);
  final List<String> result, oldCrops;
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
                itemBuilder: (context, index) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        SEASONS[index],
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    Card(
                      color: Colors.green[100],
                      elevation: 5,
                      child: ListTile(
                        onTap: () => Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (_) => CropDetailsScreen(
                              name: oldCrops[index],
                            ),
                          ),
                        ),
                        title: Text(
                          oldCrops[index],
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
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
                itemBuilder: (context, index) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        SEASONS[index],
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    Card(
                      color: Colors.green[100],
                      elevation: 5,
                      child: ListTile(
                        onTap: () => Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (_) => CropDetailsScreen(
                              name: result[index],
                            ),
                          ),
                        ),
                        title: Text(
                          result[index],
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}
