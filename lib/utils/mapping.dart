import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:kissan_mitra/classes/crop_details/crop_details.dart';

class Mapping {
  List<String> _cropNames, _districtName;
  List<CropDetails> _cropDetailsList;
  static const _soil = [
    "Alluvial",
    "Black",
    "Laterite",
    "Red",
    "Sandy",
  ];

  static const _season = [
    "Summer",
    "Rabi",
    "Kharif",
    "Kharif",
    "Rabi",
    "Kharif",
    "Summer",
    "Kharif",
    "Summer",
    "Kharif",
    "Summer",
    "Rabi",
    "Kharif",
    "Summer",
    "Summer",
    "Rabi",
    "Summer",
    "Rabi",
    "Summer",
    "Kharif",
    "Rabi",
    "Kharif",
    "Kharif",
    "Rabi",
    "Rabi",
    "Kharif",
    "Summer",
    "Summer",
    "Kharif",
    "Kharif",
    "Rabi",
    "Summer",
    "Rabi",
    "Kharif",
    "Kharif",
    "Rabi",
    "Rabi",
    "Kharif",
    "Rabi",
    "Kharif",
    "Rabi",
    "Rabi",
    "Rabi",
    "Kharif",
    "Kharif",
    "Kharif",
    "Rabi",
    "Rabi",
    "Summer",
    "Summer",
    "Summer",
    "Kharif",
    "Summer",
    "Rabi",
  ];

  static const _state = [
    "Andaman and Nicobar Islands",
    "Andhra Pradesh",
    "Arunachal Pradesh",
    "Assam",
    "Bihar",
    "Chandigarh",
    "Chhattisgarh",
    "Dadra and Nagar Haveli",
    "Goa",
    "Gujarat",
    "Haryana",
    "Himachal Pradesh",
    "Jammu and Kashmir ",
    "Jharkhand",
    "Karnataka",
    "Kerala",
    "Madhya Pradesh",
    "Maharashtra",
    "Manipur",
    "Meghalaya",
    "Mizoram",
    "Nagaland",
    "Odisha",
    "Puducherry",
    "Punjab",
    "Rajasthan",
    "Sikkim",
    "Tamil Nadu",
    "Telangana ",
    "Tripura",
    "Uttar Pradesh",
    "Uttarakhand",
    "West Bengal",
  ];

  Future<String> getCropName(int index) async {
    if (_cropNames == null) _cropNames = await _readCSV("assets/csv/crop.csv");
    return _cropNames[index];
  }

  Future<List<String>> get crops async {
    if (_cropNames == null) _cropNames = await _readCSV("assets/csv/crop.csv");
    return _cropNames;
  }

  Future<int> getCropIndex(String name) async {
    if (_cropNames == null) _cropNames = await _readCSV("assets/csv/crop.csv");
    return _cropNames.indexOf(name);
  }

  Future<int> getDistrictIndex(String name) async {
    if (_districtName == null)
      _districtName = await _readCSV("assets/csv/district_name.csv");
    return _districtName.indexOf(name);
  }

  int getSoil(String name) {
    return _soil.indexOf(name);
  }

  int getState(String name) {
    return _state.indexOf(name);
  }

  int getSeason(String name) {
    return _season.indexOf(name);
  }

  Future<CropDetails> getCropData(int index) async {
    if (_cropDetailsList == null) _cropDetailsList = await _getCropDetails();

    return _cropDetailsList[index];
  }

  Future<List<String>> _readCSV(String file) async {
    final data = await rootBundle.loadString(file);
    return data.split("\n");
  }

  Future<List<CropDetails>> _getCropDetails() async {
    final rawData =
        await rootBundle.loadString("assets/json/crop_details.json");

    return (jsonDecode(rawData) as List).map((e) => e as CropDetails).toList();
  }
}
