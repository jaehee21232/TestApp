import 'package:flutter/cupertino.dart';

class FishModel with ChangeNotifier {
  final String name;
  int number;
  final String size;

  FishModel({required this.name, required this.number, required this.size});
  void changenotifier() {
    number++;
    notifyListeners();
  }
}
