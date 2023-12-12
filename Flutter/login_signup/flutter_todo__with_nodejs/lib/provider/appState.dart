import 'package:flutter/material.dart';

class AppState {
  String breadcrumbs;

  AppState({required this.breadcrumbs});
}

class AppStateProvider with ChangeNotifier {
  AppState? _appState;

  AppState? get appState => _appState;

  void setAppState(AppState appState) {
    _appState = appState;
    notifyListeners();
  }

  void setBreadcrumbs(String breadcrumbs) {
    print(breadcrumbs);
    _appState?.breadcrumbs = breadcrumbs;
    print(_appState?.breadcrumbs);
    notifyListeners();
  }
}

