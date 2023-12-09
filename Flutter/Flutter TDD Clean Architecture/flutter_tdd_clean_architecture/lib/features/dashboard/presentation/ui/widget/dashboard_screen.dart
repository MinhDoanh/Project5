import 'package:flutter/material.dart';
import 'package:flutter_tdd_clean_architecture/features/dashboard/presentation/ui/widget/bottom_navifation_widget.dart';

class DashBoardScreen extends StatelessWidget {
  final Widget child;
  const DashBoardScreen({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DashBoard '),
        centerTitle: true,
      ),
      body: child,
      bottomNavigationBar: const BottomNavigationWidget(),
    );
  }
}
