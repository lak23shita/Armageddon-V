import 'package:json_annotation/json_annotation.dart';

part 'rainfall_details.g.dart';

@JsonSerializable()
class RainfallDetails {
  final String stateName;
  final double janFeb, marMay, junSep, octDec;

  RainfallDetails({
    this.stateName,
    this.janFeb,
    this.marMay,
    this.junSep,
    this.octDec,
  });

  factory RainfallDetails.fromJson(Map<String, dynamic> json) =>
      _$RainfallDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$RainfallDetailsToJson(this);
}
