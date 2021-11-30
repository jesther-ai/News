import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class News with ChangeNotifier {
  String topic = '';

  List<dynamic> _articles = [];
  bool _isLoaded = false;

  List get data => [..._articles];
  bool get isLoadedBool => _isLoaded;

  load(String searchString) {
    String address = 'https://newsapi.org/v2/everything?q=' +
        searchString +
        '&from=2021-11-30&sortBy=popularity&apiKey=33237530c5124ed29346be7e5efcbd57';
    http.get(Uri.parse(address)).then(
      (value) {
        Map<String, dynamic> data;
        data = json.decode(value.body);
        _articles = data['articles'];
        _isLoaded = true;
        notifyListeners();
      },
    );
  }

  reset() {
    _isLoaded = false;
    notifyListeners();
  }
}
