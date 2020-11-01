import 'package:kissan_mitra/constants.dart';
import 'package:kissan_mitra/utils/get_it_init.dart';
import 'package:kissan_mitra/utils/mapping.dart';

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
}
