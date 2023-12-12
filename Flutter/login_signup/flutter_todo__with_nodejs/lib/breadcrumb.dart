import 'package:flutter/material.dart';
import 'package:flutter_todo_app/provider/appState.dart';
import 'package:provider/provider.dart';

class Breadcrumb extends StatefulWidget {
  Breadcrumb({super.key});

  @override
  State<Breadcrumb> createState() => _BreadcrumbState();
}

class _BreadcrumbState extends State<Breadcrumb> {
  @override
  Widget build(BuildContext context) {
    return Text(
      'Trang chủ > ${context.watch<AppStateProvider>().appState?.breadcrumbs}',
      style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
    );
  }
}
