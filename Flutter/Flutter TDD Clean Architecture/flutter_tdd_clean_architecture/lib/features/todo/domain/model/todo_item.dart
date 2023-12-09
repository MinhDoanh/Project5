
import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_item.freezed.dart';
part 'todo_item.g.dart';
@freezed
class ToDoItem with _$ToDoItem {
  const factory ToDoItem({
    @JsonKey(name: 'user_id')
        required int userId,
        required int id,
        required String title,
        required bool completed,
  }) = _ToDoItem;

  factory ToDoItem.fromJson(Map<String, dynamic> json) => _$ToDoItemFromJson(json);
}