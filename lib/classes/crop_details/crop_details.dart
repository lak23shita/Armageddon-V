import 'package:json_annotation/json_annotation.dart';

part 'crop_details.g.dart';

@JsonSerializable()
class CropDetails {
  final String name,
      area,
      seedRate,
      spacing,
      timeOfSowing,
      methodOfSowing,
      timeOfWater,
      nutrientRecommendation,
      weedManagement,
      insectManagement,
      diseaseManagement,
      strawYield;

  CropDetails({
    this.name,
    this.area,
    this.seedRate,
    this.spacing,
    this.timeOfSowing,
    this.methodOfSowing,
    this.timeOfWater,
    this.nutrientRecommendation,
    this.weedManagement,
    this.insectManagement,
    this.diseaseManagement,
    this.strawYield,
  });

  factory CropDetails.fromJson(Map<String, dynamic> json) =>
      _$CropDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$CropDetailsToJson(this);
}
