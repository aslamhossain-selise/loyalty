import 'package:flutter/cupertino.dart';

class Order with ChangeNotifier {
  var order = '';

  String get orderAmount {
    return order;
  }

  void addOrder(int num) {
    order = '$order$num';

    notifyListeners();
  }
}
