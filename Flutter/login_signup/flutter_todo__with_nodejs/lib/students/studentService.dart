import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_todo_app/config.dart';
import 'package:flutter_todo_app/provider/appState.dart';
import 'package:provider/provider.dart';

class StudentService {
  static Future<void> fetchStudents(BuildContext context) async {
    final response = await http.get(Uri.http(url, getAllStudentAPI));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      final studentList = data['data'] as List<dynamic>;
      print("Student list: " + studentList.toString());

      // setState(() {
      //   students = studentList.cast<Map<String, dynamic>>();
      // });

      Provider.of<AppStateProvider>(context, listen: false)
          .setStudents(studentList.cast<Map<String, dynamic>>());
    } else {
      throw Exception('Failed to fetch students');
    }
  }

  static getStudentByStudentID(String? studentId) {}
}