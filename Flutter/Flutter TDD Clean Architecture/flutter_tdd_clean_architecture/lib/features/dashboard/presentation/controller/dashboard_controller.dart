import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tdd_clean_architecture/features/dashboard/presentation/state/dashboard_state.dart';

class DashBoardController extends Cubit<DashBoardState> {
  DashBoardController() : super(const DashBoardState());

  void setPageIndex(int value) {
    emit(state.copyWith(pageIndex: value));
  }
}