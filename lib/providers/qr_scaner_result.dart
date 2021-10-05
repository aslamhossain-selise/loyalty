import 'package:flutter/material.dart';

class ScanItem {
  final String? id;
  final String? value;

  ScanItem({
    @required this.id,
    @required this.value,
  });
}

class ScanItemData with ChangeNotifier {
  List<ScanItem> _items = [];

  List<ScanItem> get items {
    return [..._items];
  }

  int get countItem {
    return _items.length;
  }

  void addItem(String id, String scanValue) {
    _items.insert(
      0,
      ScanItem(id: id, value: scanValue),
    );
    notifyListeners();
  }
}
