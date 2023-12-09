import 'package:flutter_tdd_clean_architecture/features/todo/data/dto/todo_response.dart';

abstract class IToDoRepository {
  Future<ToDoResponse>  getToDo(int id);
}