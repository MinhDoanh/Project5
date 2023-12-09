// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ToDoResponseImpl _$$ToDoResponseImplFromJson(Map<String, dynamic> json) =>
    _$ToDoResponseImpl(
      userId: json['user_id'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      completed: json['completed'] as bool,
    );

Map<String, dynamic> _$$ToDoResponseImplToJson(_$ToDoResponseImpl instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'id': instance.id,
      'title': instance.title,
      'completed': instance.completed,
    };
