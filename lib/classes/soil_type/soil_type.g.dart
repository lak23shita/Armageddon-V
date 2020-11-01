// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'soil_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SoilType _$SoilTypeFromJson(Map<String, dynamic> json) {
  return SoilType(
    district: json['district'] as String,
    nitrogen: (json['nitrogen'] as num)?.toDouble(),
    organicCarbon: (json['organicCarbon'] as num)?.toDouble(),
    phosphorus: (json['phosphorus'] as num)?.toDouble(),
    potassium: (json['potassium'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$SoilTypeToJson(SoilType instance) => <String, dynamic>{
      'district': instance.district,
      'nitrogen': instance.nitrogen,
      'organicCarbon': instance.organicCarbon,
      'phosphorus': instance.phosphorus,
      'potassium': instance.potassium,
    };
