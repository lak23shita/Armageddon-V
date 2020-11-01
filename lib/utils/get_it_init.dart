import 'package:get_it/get_it.dart';
import 'package:kissan_mitra/utils/location_service.dart';

import '../services/crop_suggest_api.dart';
import '../services/data_modifier.dart';
import '../services/weather_data.dart';
import 'mapping.dart';

final locator = GetIt.I;

void getItInit() {
  locator.registerLazySingleton(() => CropSuggestAPI());
  locator.registerLazySingleton(() => Mapping());
  locator.registerLazySingleton(() => DataModifier());
  locator.registerLazySingleton(() => LocationService());
  locator.registerLazySingleton(() => WeatherData());
}
