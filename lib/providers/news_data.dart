import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class News with ChangeNotifier {
  String _topic = 'News';

  List<dynamic> _articles = [];
  bool _isLoaded = false;

  List get data => [..._articles];
  bool get isLoadedBool => _isLoaded;
  String get topicTitle => _topic;

  load(String searchString) {
    _isLoaded = false;
    notifyListeners();
    String address = 'https://newsapi.org/v2/everything?q=' +
        searchString +
        '&from=2021-11-30&sortBy=popularity&apiKey=33237530c5124ed29346be7e5efcbd57';
    http.get(Uri.parse(address)).then(
      (value) {
        Map<String, dynamic> data;
        data = json.decode(value.body);
        _articles = data['articles'];
        _isLoaded = true;
        _topic = searchString;
        notifyListeners();
      },
    );
  }

  reset() {
    _isLoaded = false;
    notifyListeners();
  }
}
