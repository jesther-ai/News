import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Utilities/api_request.dart';

class News with ChangeNotifier {
  String _searchString = 'News';
  List<dynamic> _articles = [];
  bool _isLoaded = false;

  List get data => [..._articles];
  bool get isLoaded => _isLoaded;
  String get searchString => _searchString;

  load(String searchString) {
    _isLoaded = false;
    _searchString = searchString;
    notifyListeners();
    API().request(searchString).then((value) {
      if (value['status'] == 'ok') {
        _isLoaded = true;
        _articles = value['articles'];
        notifyListeners();
        print(value);
      }
    });
  }

  reset() {
    _isLoaded = false;
    notifyListeners();
  }
}
