import 'package:flutter/material.dart';
import 'package:flutter_tdd_clean_architecture/core/route/go_router_provider.dart';
import 'package:flutter_tdd_clean_architecture/core/service_locator.dart';
import 'package:flutter_tdd_clean_architecture/core/theme/color_schemes.dart';

class MainWidget extends StatelessWidget {
  const MainWidget({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final route = getIt.get<GoRouterProvider>();

    return MaterialApp.router(
      title: 'Todo App',
      routerConfig: route.goRouter(),
      theme: ThemeData(
        colorScheme: lightColorScheme,
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: darkColorScheme,
        useMaterial3: true,
      ),
    );
  }
}