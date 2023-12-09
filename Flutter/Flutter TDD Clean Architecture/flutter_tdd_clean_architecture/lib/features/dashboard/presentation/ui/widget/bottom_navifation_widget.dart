import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tdd_clean_architecture/features/dashboard/presentation/controller/dashboard_controller.dart';
import 'package:flutter_tdd_clean_architecture/features/dashboard/presentation/state/dashboard_state.dart';
import 'package:go_router/go_router.dart';

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashBoardController(),
      child: BlocBuilder<DashBoardController, DashBoardState>(
        builder: (context, state) {
          return NavigationBar(
              selectedIndex: state.pageIndex,
              onDestinationSelected: (value) => _onItemSelected(context, value),
              destinations: const [
                NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
                NavigationDestination(icon: Icon(Icons.settings), label: 'Setting')
              ]);
        }
      ),
    );
  }

  void _onItemSelected(BuildContext context, int index) {
    context.read<DashBoardController>().setPageIndex(index);

    switch (index) {  
      case 0:
        GoRouter.of(context).go('/');
        break;
      case 1:
        GoRouter.of(context).go('/setting');
        break;
      default:
        throw Exception('No item found');
    }
  }
}
