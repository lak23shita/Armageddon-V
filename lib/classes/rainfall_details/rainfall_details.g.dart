// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rainfall_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RainfallDetails _$RainfallDetailsFromJson(Map<String, dynamic> json) {
  return RainfallDetails(
    stateName: json['stateName'] as String,
    janFeb: (json['janFeb'] as num)?.toDouble(),
    marMay: (json['marMay'] as num)?.toDouble(),
    junSep: (json['junSep'] as num)?.toDouble(),
    octDec: (json['octDec'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$RainfallDetailsToJson(RainfallDetails instance) =>
    <String, dynamic>{
      'stateName': instance.stateName,
      'janFeb': instance.janFeb,
      'marMay': instance.marMay,
      'junSep': instance.junSep,
      'octDec': instance.octDec,
    };
