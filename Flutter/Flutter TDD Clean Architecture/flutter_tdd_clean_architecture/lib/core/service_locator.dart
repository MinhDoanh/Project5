import 'package:flutter_tdd_clean_architecture/core/route/go_router_provider.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void serviceLocatorInit() {
  getIt.registerFactory(() => GoRouterProvider());
}