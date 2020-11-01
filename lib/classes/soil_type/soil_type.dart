import 'package:json_annotation/json_annotation.dart';

part 'soil_type.g.dart';

@JsonSerializable()
class SoilType {
  final String district;
  final double nitrogen, organicCarbon, phosphorus, potassium;

  SoilType({
    this.district,
    this.nitrogen,
    this.organicCarbon,
    this.phosphorus,
    this.potassium,
  });

  factory SoilType.fromJson(Map<String, dynamic> json) =>
      _$SoilTypeFromJson(json);

  Map<String, dynamic> toJson() => _$SoilTypeToJson(this);
}
