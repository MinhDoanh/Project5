// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DashBoardState {
  int get pageIndex => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DashBoardStateCopyWith<DashBoardState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashBoardStateCopyWith<$Res> {
  factory $DashBoardStateCopyWith(
          DashBoardState value, $Res Function(DashBoardState) then) =
      _$DashBoardStateCopyWithImpl<$Res, DashBoardState>;
  @useResult
  $Res call({int pageIndex});
}

/// @nodoc
class _$DashBoardStateCopyWithImpl<$Res, $Val extends DashBoardState>
    implements $DashBoardStateCopyWith<$Res> {
  _$DashBoardStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageIndex = null,
  }) {
    return _then(_value.copyWith(
      pageIndex: null == pageIndex
          ? _value.pageIndex
          : pageIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DashBoardStateImplCopyWith<$Res>
    implements $DashBoardStateCopyWith<$Res> {
  factory _$$DashBoardStateImplCopyWith(_$DashBoardStateImpl value,
          $Res Function(_$DashBoardStateImpl) then) =
      __$$DashBoardStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int pageIndex});
}

/// @nodoc
class __$$DashBoardStateImplCopyWithImpl<$Res>
    extends _$DashBoardStateCopyWithImpl<$Res, _$DashBoardStateImpl>
    implements _$$DashBoardStateImplCopyWith<$Res> {
  __$$DashBoardStateImplCopyWithImpl(
      _$DashBoardStateImpl _value, $Res Function(_$DashBoardStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageIndex = null,
  }) {
    return _then(_$DashBoardStateImpl(
      pageIndex: null == pageIndex
          ? _value.pageIndex
          : pageIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$DashBoardStateImpl implements _DashBoardState {
  const _$DashBoardStateImpl({this.pageIndex = 0});

  @override
  @JsonKey()
  final int pageIndex;

  @override
  String toString() {
    return 'DashBoardState(pageIndex: $pageIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashBoardStateImpl &&
            (identical(other.pageIndex, pageIndex) ||
                other.pageIndex == pageIndex));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pageIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DashBoardStateImplCopyWith<_$DashBoardStateImpl> get copyWith =>
      __$$DashBoardStateImplCopyWithImpl<_$DashBoardStateImpl>(
          this, _$identity);
}

abstract class _DashBoardState implements DashBoardState {
  const factory _DashBoardState({final int pageIndex}) = _$DashBoardStateImpl;

  @override
  int get pageIndex;
  @override
  @JsonKey(ignore: true)
  _$$DashBoardStateImplCopyWith<_$DashBoardStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
