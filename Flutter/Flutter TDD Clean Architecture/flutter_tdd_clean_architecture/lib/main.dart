import 'package:flutter/material.dart';
import 'package:flutter_tdd_clean_architecture/core/service_locator.dart';
import 'package:flutter_tdd_clean_architecture/core/theme/color_schemes.dart';
import 'package:flutter_tdd_clean_architecture/features/main_widget.dart';

void main() {
  serviceLocatorInit();

  runApp(const MainWidget());
}
