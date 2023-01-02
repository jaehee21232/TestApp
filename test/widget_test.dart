import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:testapp/model/air_result.dart';

import 'dart:convert';

void main() {
  final fineDustApi = Uri.parse(
      'http://api.airvisual.com/v2/nearest_city?key={{5879121b-01fb-4e40-80ce-9997f43707ed}}');
  test("http 통신 테스트", () async {
    try {
      var response = await http.get(fineDustApi);
      expect(response.statusCode, 200);

      AirResult result = AirResult.fromJson(json.decode(response.body));
      expect(result.status, "success");
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  });
}
