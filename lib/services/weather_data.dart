import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kissan_mitra/secret.dart';
import 'package:kissan_mitra/utils/get_it_init.dart';
import 'package:kissan_mitra/utils/location_service.dart';

class WeatherData {
  double lat, lon;

  Future<double> getApiResult(int month) async {
    final res = await http.get(
      "https://history.openweathermap.org/data/2.5/aggregated/month?month=$month&lat=$lat&lon=$lon&appid=$WEATHER_KEY",
    );
    final data = jsonDecode(res.body);
    return data["result"]["precipitation"]["mean"];
  }

  Future<List<double>> getRainFallData() async {
    final pos = await locator<LocationService>().getLatLon();
    lat = pos[0];
    lon = pos[1];
    double sum = 0;
    List<Future<double>> fRes = [];
    for (int i = 1; i <= 12; i++) fRes.add(getApiResult(i));

    final data = await Future.wait<double>(fRes);

    List<double> result = [];
    result.add((data[0] + data[1]) / 2); // jan feb
    for (int i = 3; i <= 5; i++) sum += data[i];
    result.add(sum / 3);

    sum = 0;
    for (int i = 6; i <= 9; i++) sum += data[i];
    result.add(sum / 4);

    sum = 0;
    for (int i = 10; i <= 12; i++) sum += data[i];
    result.add(sum / 3);

    return result;
  }
}
