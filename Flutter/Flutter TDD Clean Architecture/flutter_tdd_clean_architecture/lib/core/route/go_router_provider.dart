import 'package:flutter/material.dart';
import 'package:flutter_tdd_clean_architecture/core/route/route_name.dart';
import 'package:flutter_tdd_clean_architecture/features/dashboard/presentation/ui/widget/dashboard_screen.dart';
import 'package:flutter_tdd_clean_architecture/features/setting/presentation/ui/widget/setting_screen.dart';
import 'package:flutter_tdd_clean_architecture/features/todo/presentation/ui/widget/todo_screen.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey(debugLabel: 'shell');

class GoRouterProvider {
  GoRouter goRouter() {
    return GoRouter(
        navigatorKey: _rootNavigatorKey,
        initialLocation: '/',
        routes: [
          ShellRoute(
            navigatorKey: _shellNavigatorKey,
            builder: (context, state, child) {
              return DashBoardScreen(
                key: state.pageKey,
                child: child,
              );
            },
            routes: [
              GoRoute(
                  path: '/',
                  name: homeRoute,
                  pageBuilder: (context, state) {
                    return NoTransitionPage(
                        child: ToDoScreen(key: state.pageKey));
                  }),
              GoRoute(
                  path: '/setting',
                  name: settingRoute,
                  pageBuilder: (context, state) {
                    return NoTransitionPage(
                        child: SettingScreen(key: state.pageKey));
                  })
            ],
          )
        ]);
  }
}
