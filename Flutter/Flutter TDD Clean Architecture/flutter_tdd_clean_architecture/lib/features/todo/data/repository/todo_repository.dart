import 'dart:io';

import 'package:flutter_tdd_clean_architecture/core/exception/failure.dart';
import 'package:flutter_tdd_clean_architecture/core/extension/http_response_error.dart';
import 'package:flutter_tdd_clean_architecture/features/todo/data/api/itodo_api_serrvice.dart';
import 'package:flutter_tdd_clean_architecture/features/todo/data/dto/todo_response.dart';
import 'package:flutter_tdd_clean_architecture/features/todo/data/repository/itodo_repository.dart';

class ToDoRepository implements IToDoRepository {
  final IToDoApiService _toDoApiService;

  ToDoRepository(this._toDoApiService);

  @override
  Future<ToDoResponse> getToDo(int id)  async{
    try {
      final response = await _toDoApiService.getToDo(id);
    
      if (response.statusCode != HttpStatus.ok) {
        throw Failure(message: response.httpResponseError());
      }

      return toDoResponseFromJson(response.body);
    } catch (e) {
      throw Failure(message: e.toString());
    }
  }

}