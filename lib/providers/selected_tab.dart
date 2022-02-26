import 'package:flutter/foundation.dart';

class SelectedTab with ChangeNotifier {
  int _tabIndex = 0;

  int get tabIndex => _tabIndex;

  setTabIndex(value) {
    _tabIndex = value;
    notifyListeners();
  }
}
