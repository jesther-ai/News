import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class News with ChangeNotifier {
  static String address =
      'https://newsapi.org/v2/everything?q=Apple&from=2021-11-30&sortBy=popularity&apiKey=33237530c5124ed29346be7e5efcbd57';

  Uri endPoint = Uri.parse(address);
  List<dynamic> articles = [];
  bool isLoaded = false;

  List get getData => [...articles];
  bool get isLoadedBool => isLoaded;

  load() {
    http.get(endPoint).then(
      (value) {
        Map<String, dynamic> data;
        data = json.decode(value.body);
        articles = data['articles'];
        isLoaded = true;
        notifyListeners();
      },
    );
  }
}
