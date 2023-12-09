// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ToDoItem _$ToDoItemFromJson(Map<String, dynamic> json) {
  return _ToDoItem.fromJson(json);
}

/// @nodoc
mixin _$ToDoItem {
  @JsonKey(name: 'user_id')
  int get userId => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  bool get completed => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ToDoItemCopyWith<ToDoItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ToDoItemCopyWith<$Res> {
  factory $ToDoItemCopyWith(ToDoItem value, $Res Function(ToDoItem) then) =
      _$ToDoItemCopyWithImpl<$Res, ToDoItem>;
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') int userId,
      int id,
      String title,
      bool completed});
}

/// @nodoc
class _$ToDoItemCopyWithImpl<$Res, $Val extends ToDoItem>
    implements $ToDoItemCopyWith<$Res> {
  _$ToDoItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? id = null,
    Object? title = null,
    Object? completed = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      completed: null == completed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ToDoItemImplCopyWith<$Res>
    implements $ToDoItemCopyWith<$Res> {
  factory _$$ToDoItemImplCopyWith(
          _$ToDoItemImpl value, $Res Function(_$ToDoItemImpl) then) =
      __$$ToDoItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') int userId,
      int id,
      String title,
      bool completed});
}

/// @nodoc
class __$$ToDoItemImplCopyWithImpl<$Res>
    extends _$ToDoItemCopyWithImpl<$Res, _$ToDoItemImpl>
    implements _$$ToDoItemImplCopyWith<$Res> {
  __$$ToDoItemImplCopyWithImpl(
      _$ToDoItemImpl _value, $Res Function(_$ToDoItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? id = null,
    Object? title = null,
    Object? completed = null,
  }) {
    return _then(_$ToDoItemImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      completed: null == completed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ToDoItemImpl implements _ToDoItem {
  const _$ToDoItemImpl(
      {@JsonKey(name: 'user_id') required this.userId,
      required this.id,
      required this.title,
      required this.completed});

  factory _$ToDoItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ToDoItemImplFromJson(json);

  @override
  @JsonKey(name: 'user_id')
  final int userId;
  @override
  final int id;
  @override
  final String title;
  @override
  final bool completed;

  @override
  String toString() {
    return 'ToDoItem(userId: $userId, id: $id, title: $title, completed: $completed)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToDoItemImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.completed, completed) ||
                other.completed == completed));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userId, id, title, completed);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ToDoItemImplCopyWith<_$ToDoItemImpl> get copyWith =>
      __$$ToDoItemImplCopyWithImpl<_$ToDoItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ToDoItemImplToJson(
      this,
    );
  }
}

abstract class _ToDoItem implements ToDoItem {
  const factory _ToDoItem(
      {@JsonKey(name: 'user_id') required final int userId,
      required final int id,
      required final String title,
      required final bool completed}) = _$ToDoItemImpl;

  factory _ToDoItem.fromJson(Map<String, dynamic> json) =
      _$ToDoItemImpl.fromJson;

  @override
  @JsonKey(name: 'user_id')
  int get userId;
  @override
  int get id;
  @override
  String get title;
  @override
  bool get completed;
  @override
  @JsonKey(ignore: true)
  _$$ToDoItemImplCopyWith<_$ToDoItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
