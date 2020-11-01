import '../constants.dart';
import '../enums/input_enum.dart';
import '../utils/get_it_init.dart';
import '../utils/location_service.dart';
import '../utils/mapping.dart';

class DataModifier {
  final _mapping = locator<Mapping>();
  List<String> getTopResult(List<String> list, List<String> old) {
    List<String> res = List<String>(3);

    for (int i = 0; i < 3; i++)
      res[i] = list.firstWhere(
        (crop) => _mapping.getCropType(crop) == SEASONS[i] && crop != old[i],
      );

    return res;
  }

  Future<List<double>> getParameters(Map<InputEnum, dynamic> analysis) async {
    List<double> res = List<double>.filled(25, 0);
    final pos = await locator<LocationService>().getStateDist();

    String state = pos[0], district = pos[1];

    res[0] = _mapping.getState(state).toDouble();
    res[1] = (await _mapping.getDistrictIndex(district)).toDouble();
    res[2] = analysis[InputEnum.season].toDouble();
    res[3] = analysis[InputEnum.area].toDouble();
    res[4] = analysis[InputEnum.production].toDouble();
    // final rain = await locator<WeatherData>().getRainFallData();
    final rain = await _mapping.getRainFallDetail(state);
    res[5] = rain.janFeb;
    res[6] = rain.marMay;
    res[7] = rain.junSep;
    res[8] = rain.octDec;
    final depth = analysis[InputEnum.depthOftubeWell];
    for (int i = 9; i <= 13; i++) if (i == depth + 9) res[i] = 1;
    final energy = analysis[InputEnum.energySource];
    for (int i = 14; i <= 19; i++) if (i == energy + 14) res[i] = 1;
    // res[20] = _mapping.getSoilType(state).toDouble();
    final soilDetails = await _mapping.getSoilTypeDetail(district);
    res[21] = soilDetails.nitrogen;
    res[22] = soilDetails.organicCarbon;
    res[23] = soilDetails.phosphorus;
    res[24] = soilDetails.potassium;

    return res;
  }
}
