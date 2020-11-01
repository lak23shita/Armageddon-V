import 'dart:convert';

import 'package:flutter/services.dart';

import '../classes/soil_type/soil_type.dart';
import '../classes/crop_details/crop_details.dart';
import '../classes/rainfall_details/rainfall_details.dart';

class Mapping {
  List<String> _districtName;
  List<CropDetails> _cropDetailsList;
  List<SoilType> _soilTypeList;
  List<RainfallDetails> _rainfallList;

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

  static const _cropNames = [
    "Arecanut",
    "Arhar/Tur",
    "Bajra",
    "Banana",
    "Barley",
    "Black pepper",
    "Brinjal",
    "Cardamom",
    "Cashewnut",
    "Castor seed",
    "Coconut ",
    "Coriander",
    "Cotton(lint)",
    "Cowpea(Lobia)",
    "Dry chillies",
    "Dry ginger",
    "Garlic",
    "Gram",
    "Groundnut",
    "Guar seed",
    "Horse-gram",
    "Jowar",
    "Jute",
    "Khesari",
    "Linseed",
    "Maize",
    "Mango",
    "Masoor",
    "Mesta",
    "Moong(Green Gram)",
    "Moth",
    "Niger seed",
    "Onion",
    "Paddy",
    "Papaya",
    "Peas & beans (Pulses)",
    "Potato",
    "Ragi",
    "Rapeseed &Mustard",
    "Rice",
    "Safflower",
    "Sannhamp",
    "Sesamum",
    "Small millets",
    "Soyabean",
    "Sugarcane",
    "Sunflower",
    "Sweet potato",
    "Tapioca",
    "Tobacco",
    "Tomato",
    "Turmeric",
    "Urad",
    "Wheat",
  ];

  static const _cropTypes = [
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

  static const _soilType = [
    "Sandy",
    "Laterite",
    "Alluvial",
    "Alluvial",
    "Alluvial",
    "Sandy",
    "Laterite",
    "Sandy",
    "Laterite",
    "Sandy",
    "Alluvial",
    "Alluvial",
    "Alluvial",
    "Black",
    "Red",
    "Laterite",
    "Black",
    "Black",
    "Alluvial",
    "Alluvial",
    "Alluvial",
    "Alluvial",
    "Red",
    "Laterite",
    "Alluvial",
    "Sandy",
    "Alluvial",
    "Laterite",
    "Laterite",
    "Alluvial",
    "Alluvial",
    "Alluvial",
    "Alluvial",
  ];

  String getCropName(int index) {
    return _cropNames[index];
  }

  List<String> get crops {
    return _cropNames;
  }

  int getCropIndex(String name) {
    return _cropNames.indexOf(name);
  }

  Future<int> getDistrictIndex(String name) async {
    if (_districtName == null)
      _districtName = await _readCSV("assets/csv/district_name.csv");
    return _districtName.indexOf(name);
  }

  getCropType(String cropName) => _cropTypes[crops.indexOf(cropName)];

  int getSoil(String name) {
    return _soil.indexOf(name);
  }

  int getState(String name) {
    return _state.indexOf(name);
  }

  int getSeason(String name) {
    return _season.indexOf(name);
  }

  int getSoilType(String state) =>
      _soil.indexOf(_soilType[_state.indexOf(state)]);

  Future<CropDetails> getCropData(String cropName) async {
    if (_cropDetailsList == null) _cropDetailsList = await _getCropDetails();
    return _cropDetailsList.firstWhere((crop) => crop.name == cropName);
  }

  Future<SoilType> getSoilTypeDetail(String district) async {
    if (_soilTypeList == null) _soilTypeList = await _getSoilDetails();

    return _soilTypeList.firstWhere(
      (soil) => soil.district.toLowerCase() == district.toLowerCase(),
    );
  }

  Future<RainfallDetails> getRainFallDetail(String state) async {
    if (_rainfallList == null) _rainfallList = await _getRailFallDetails();

    return _rainfallList[_state.indexOf(state)];
  }

  Future<List<String>> _readCSV(String file) async {
    final data = await rootBundle.loadString(file);
    return data.split("\n");
  }

  Future<List<CropDetails>> _getCropDetails() async {
    final rawData =
        await rootBundle.loadString("assets/json/crop_details.json");

    return (jsonDecode(rawData) as List)
        .map((e) => CropDetails.fromJson(e))
        .toList();
  }

  Future<List<SoilType>> _getSoilDetails() async {
    final rawData = await rootBundle.loadString("assets/json/soil_type.json");

    return (jsonDecode(rawData) as List)
        .map((e) => SoilType.fromJson(e))
        .toList();
  }

  Future<List<RainfallDetails>> _getRailFallDetails() async {
    final rawData = await rootBundle.loadString("assets/json/rainfall.json");

    return (jsonDecode(rawData) as List)
        .map((e) => RainfallDetails.fromJson(e))
        .toList();
  }
}
