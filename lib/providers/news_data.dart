import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Utilities/api_request.dart';

class News with ChangeNotifier {
  String _searchString = 'News';
  List<dynamic> _searchResult = [];
  List<dynamic> _trendingArticles = [];
  bool _isLoadedTrending = false;
  bool _isLoadedSearch = false;
  List get searchResult => [..._searchResult];
  List get trendingArticles => [..._trendingArticles];
  bool get isLoadedTrending => _isLoadedTrending;
  bool get isLoadedSearch => _isLoadedSearch;
  String get searchString => _searchString;

  loadTrending() {
    resetTreding();
    notifyListeners();
    API().request('Trending').then((value) {
      if (value['status'] == 'ok') {
        _isLoadedTrending = true;
        _trendingArticles = value['articles'];
        notifyListeners();
      }
    });
  }

  searchNews(String searchString) {
    resetSearching();
    _searchString = searchString;
    notifyListeners();
    API().request(searchString).then((value) {
      if (value['status'] == 'ok') {
        _isLoadedSearch = true;
        _searchResult = value['articles'];
        notifyListeners();
      }
    });
  }

  resetTreding() {
    _trendingArticles.clear();
    _isLoadedTrending = false;
    notifyListeners();
  }

  resetSearching() {
    _searchResult.clear();
    _isLoadedSearch = false;
    notifyListeners();
  }
}
