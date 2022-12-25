import 'package:flutter/material.dart';
import 'package:testapp/model/AirResult.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FineDustApp extends StatefulWidget {
  const FineDustApp({super.key});

  @override
  State<FineDustApp> createState() => _FineDustAppState();
}

class _FineDustAppState extends State<FineDustApp> {
  AirResult? _result;
  final fine_dust_api = Uri.parse(
      'http://api.airvisual.com/v2/nearest_city?key=5879121b-01fb-4e40-80ce-9997f43707ed');

  Future<AirResult> fetchData() async {
    var response = await http.get(fine_dust_api);

    AirResult result = AirResult.fromJson(json.decode(response.body));
    return result;
  }

  Color GetColor(AirResult value) {
    int? aquis = value.data?.current?.pollution?.aqius;
    if (aquis! <= 50) {
      return Colors.greenAccent;
    } else if (aquis <= 100) {
      return Colors.yellow;
    } else if (aquis <= 150) {
      return Colors.orangeAccent;
    }
    return Colors.greenAccent;
  }

  @override
  void initState() {
    super.initState();
    fetchData().then((value) => setState((() {
          _result = value;
        })));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _result == null
          ? CircularProgressIndicator()
          : Center(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("현재 위치 미세먼지 농도"),
                Card(
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        color: GetColor(_result!),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("얼굴사진"),
                            Text(
                              "${_result!.data?.current?.pollution?.aqius}",
                              style: TextStyle(fontSize: 40),
                            ),
                            Text(
                              "보통",
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              Image.network(
                                  "https://airvisual.com/images/${_result?.data?.current?.weather?.ic}.png",
                                  width: 30),
                              Text("${_result!.data?.current?.weather?.tp}°")
                            ],
                          ),
                          Text("습도 ${_result!.data?.current?.weather?.hu}"),
                          Text("풍속 ${_result!.data?.current?.weather?.ws}"),
                        ],
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: ElevatedButton(
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                                EdgeInsets.symmetric(
                                    vertical: 15.0, horizontal: 50.0)),
                          ),
                          onPressed: () {},
                          child: const Icon(
                            Icons.refresh,
                            color: Colors.white,
                          )),
                    )
                  ]),
                )
              ],
            )),
    );
  }
}
