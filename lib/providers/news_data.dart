import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Utilities/api_request.dart';

class News with ChangeNotifier {
  final List<dynamic> _articles = [];
  bool _isLoaded = false;

  List get data => [..._articles];
  bool get isLoaded => _isLoaded;

  load(String searchString) {
    _isLoaded = false;
    notifyListeners();
    API().request('bitcoin').then((value) {
      if (value['status'] == 'ok') {
        print(value);
      }
    });
  }

  reset() {
    _isLoaded = false;
    notifyListeners();
  }
}
