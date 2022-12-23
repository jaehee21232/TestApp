// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:testapp/main.dart';
import 'package:testapp/model/AirResult.dart';

import 'dart:convert';

void main() {
  final fine_dust_api = Uri.parse(
      'http://api.airvisual.com/v2/nearest_city?key={{5879121b-01fb-4e40-80ce-9997f43707ed}}');
  test("http 통신 테스트", () async {
    try {
      var response = await http.get(fine_dust_api);
      expect(response.statusCode, 200);

      AirResult result = AirResult.fromJson(json.decode(response.body));
      expect(result.status, "success");
    } catch (e) {
      print(e);
    }
  });
}
