import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Utilities/api_request.dart';

class News with ChangeNotifier {
  String _searchTitle = 'News';
  String _trendingTitle = 'Ukraine';
  List<dynamic> _searchResult = [];
  List<dynamic> _trendingArticles = [];
  bool _isLoadedTrending = false;
  bool _isLoadedSearch = false;
  List get searchResult => [..._searchResult];
  List get trendingArticles => [..._trendingArticles];
  bool get isLoadedTrending => _isLoadedTrending;
  bool get isLoadedSearch => _isLoadedSearch;
  String get searchTitle => _searchTitle;
  String get trendingTitle => _trendingTitle;
  loadTrending() {
    resetTreding();
    API().request('Ukraine').then((value) {
      if (value['status'] == 'ok') {
        _trendingTitle = 'Ukraine';
        _isLoadedTrending = true;
        _trendingArticles = value['articles'];
        notifyListeners();
      }
    });
  }

  searchNews(String searchString) {
    resetSearching();
    API().request(searchString).then((value) {
      if (value['status'] == 'ok') {
        _searchTitle = searchString;
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
