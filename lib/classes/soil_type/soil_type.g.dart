// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'soil_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SoilType _$SoilTypeFromJson(Map<String, dynamic> json) {
  return SoilType(
    district: json['district'] as String,
    nitrogen: json['nitrogen'] as String,
    organicCarbon: json['organicCarbon'] as String,
    phosphorus: json['phosphorus'] as String,
    potassium: json['potassium'] as String,
  );
}

Map<String, dynamic> _$SoilTypeToJson(SoilType instance) => <String, dynamic>{
      'district': instance.district,
      'nitrogen': instance.nitrogen,
      'organicCarbon': instance.organicCarbon,
      'phosphorus': instance.phosphorus,
      'potassium': instance.potassium,
    };
