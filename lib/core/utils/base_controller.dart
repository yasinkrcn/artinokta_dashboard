import 'package:flutter/material.dart';

class BaseController with ChangeNotifier {
  BaseController() {
    init();
  }

  void init() {}

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void refresh() => notifyListeners();
}
