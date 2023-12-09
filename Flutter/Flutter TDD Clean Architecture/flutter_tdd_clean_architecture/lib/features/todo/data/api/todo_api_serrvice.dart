import 'package:flutter_tdd_clean_architecture/core/mixin/uri_mixin.dart';
import 'package:flutter_tdd_clean_architecture/features/todo/data/api/itodo_api_serrvice.dart';
import 'package:http/src/response.dart';
import 'package:http/http.dart' as http;

class ToDoApiService with UriMixin implements IToDoApiService {
  final http.Client client;

  ToDoApiService({required this.client});

  // @override
  // Future<Response> addToDo(Map<String, dynamic> body) async {
  //   try {
  //     final url = getUri('todos');

  //     return await http.post(url, body: body);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // @override
  // Future<Response> deleteToDo(int id, Map<String, dynamic> body) async {
  //   try {
  //     final url = getUri('/posts/$id');

  //     return await http.delete(url);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  @override
  Future<Response> getToDo(int id) async {
    try {
      final url = getUri('/todos/$id');
      return await http.get(url);
    } catch (e) {
      rethrow;
    }
  }

  // @override
  // Future<Response> updateToDo(Map<String, dynamic> id) async {
  //   try {
  //     final url = getUri('/posts/$id');
  //     return await http.put(url);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

}