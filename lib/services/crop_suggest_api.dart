import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kissan_mitra/utils/mapping.dart';

const String url =
    "https://b2gy3pmi6h.execute-api.us-east-2.amazonaws.com/prod/crop";

class CropSuggestAPI {
  Mapping mapping = Mapping();
  getSuggestion(List<double> data) async {
    final listString = data.toString();
    final finalData =
        listString.substring(1, listString.length - 1).replaceAll(", ", ",");

    final body = jsonEncode({"data": finalData});
    final res = await http.post(url,
        headers: {"Content-Type": "text/plain"}, body: body);

    final listData = json.decode(res.body) as List;
    final doubleList = listData.map((e) => e as double).toList();

    final cropNames = await mapping.crops;
    Map<String, double> map = {};
    for (int i = 0; i < cropNames.length; i++) {
      map[cropNames[i]] = doubleList[i];
    }

    final sorted = map.keys.toList()..sort((a, b) => map[b].compareTo(map[a]));

    return sorted;
  }
}
