// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crop_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CropDetails _$CropDetailsFromJson(Map<String, dynamic> json) {
  return CropDetails(
    name: json['name'] as String,
    area: json['area'] as String,
    seedRate: json['seedRate'] as String,
    spacing: json['spacing'] as String,
    timeOfSowing: json['timeOfSowing'] as String,
    methodOfSowing: json['methodOfSowing'] as String,
    timeOfWater: json['timeOfWater'] as String,
    nutrientRecommendation: json['nutrientRecommendation'] as String,
    weedManagement: json['weedManagement'] as String,
    insectManagement: json['insectManagement'] as String,
    diseaseManagement: json['diseaseManagement'] as String,
    strawYield: json['strawYield'] as String,
  );
}

Map<String, dynamic> _$CropDetailsToJson(CropDetails instance) =>
    <String, dynamic>{
      'name': instance.name,
      'area': instance.area,
      'seedRate': instance.seedRate,
      'spacing': instance.spacing,
      'timeOfSowing': instance.timeOfSowing,
      'methodOfSowing': instance.methodOfSowing,
      'timeOfWater': instance.timeOfWater,
      'nutrientRecommendation': instance.nutrientRecommendation,
      'weedManagement': instance.weedManagement,
      'insectManagement': instance.insectManagement,
      'diseaseManagement': instance.diseaseManagement,
      'strawYield': instance.strawYield,
    };
