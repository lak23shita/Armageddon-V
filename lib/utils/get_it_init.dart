import 'package:get_it/get_it.dart';
import 'package:kissan_mitra/services/crop_suggest_api.dart';

final locator = GetIt.I;

void getItInit() {
  locator.registerLazySingleton(() => CropSuggestAPI());
}
