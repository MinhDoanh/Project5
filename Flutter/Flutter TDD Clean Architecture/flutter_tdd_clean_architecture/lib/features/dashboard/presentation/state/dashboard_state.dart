import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_state.freezed.dart';

@freezed
class DashBoardState with _$DashBoardState {
  const factory DashBoardState({
    @Default(0)
    int pageIndex,
  }) = _DashBoardState;
}