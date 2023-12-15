import 'package:flutter/material.dart';

class AppState {
  String breadcrumbs;
  List<Map<String, dynamic>> students;

  AppState({required this.breadcrumbs, required this.students});
}

class AppStateProvider with ChangeNotifier {
  AppState? _appState;

  AppState? get appState => _appState;

  void setAppState(AppState appState) {
    _appState = appState;
    notifyListeners();
  }

  void setBreadcrumbs(String breadcrumbs) {
    _appState?.breadcrumbs = breadcrumbs;
    notifyListeners();
  }

  void setStudents(List<Map<String, dynamic>> students) {
    _appState?.students = students;
    notifyListeners();
  }
}
