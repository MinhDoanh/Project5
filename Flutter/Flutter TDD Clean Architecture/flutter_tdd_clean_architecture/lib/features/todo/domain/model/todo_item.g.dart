// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ToDoItemImpl _$$ToDoItemImplFromJson(Map<String, dynamic> json) =>
    _$ToDoItemImpl(
      userId: json['user_id'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      completed: json['completed'] as bool,
    );

Map<String, dynamic> _$$ToDoItemImplToJson(_$ToDoItemImpl instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'id': instance.id,
      'title': instance.title,
      'completed': instance.completed,
    };
