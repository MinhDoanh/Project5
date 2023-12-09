// To parse this JSON data, do
//
//     final toDoResponse = toDoResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'todo_response.freezed.dart';
part 'todo_response.g.dart';

ToDoResponse toDoResponseFromJson(String str) => ToDoResponse.fromJson(json.decode(str));

String toDoResponseToJson(ToDoResponse data) => json.encode(data.toJson());

@freezed
class ToDoResponse with _$ToDoResponse {
    const factory ToDoResponse({
        @JsonKey(name: 'user_id')
        required int userId,
        required int id,
        required String title,
        required bool completed,
    }) = _ToDoResponse;

    factory ToDoResponse.fromJson(Map<String, dynamic> json) => _$ToDoResponseFromJson(json);
}
