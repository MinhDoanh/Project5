import 'package:flutter/material.dart';
import 'package:flutter_todo_app/config.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class DataTableStudent extends StatefulWidget {
  const DataTableStudent({Key? key});

  @override
  State<DataTableStudent> createState() => _DataTableStudentState();
}

class _DataTableStudentState extends State<DataTableStudent> {
  List<Map<String, dynamic>> students = [];

  @override
  void initState() {
    super.initState();
    fetchStudents();
  }

  Future<void> fetchStudents() async {
    final response = await http.get(Uri.http(url, getAllStudentAPI));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      final studentList = data['data'] as List<dynamic>;
      print("Student list: " + studentList.toString());

      setState(() {
        students = studentList.cast<Map<String, dynamic>>();
      });
    } else {
      throw Exception('Failed to fetch students');
    }
  }

  void deleteStudent(int index) {
    // Xử lý logic xóa sinh viên ở hàng tương ứng
    // Ví dụ: students.removeAt(index);
  }

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: [
        DataColumn(
          label: Expanded(
            child: Text(
              'Mã SV',
              textAlign: TextAlign.center,
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'Họ và tên',
              textAlign: TextAlign.center,
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'Mã lớp',
              textAlign: TextAlign.center,
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'Giới tính',
              textAlign: TextAlign.center,
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'Ngày sinh',
              textAlign: TextAlign.center,
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'Tác vụ',
              textAlign: TextAlign.center,
            ),
          ),
        ),
        // Add other columns as needed
      ],
      rows: students.asMap().entries.map((entry) {
        final index = entry.key;
        final student = entry.value;

        return DataRow(
          cells: [
            DataCell(Center(child: Text(student['studentId']))),
            DataCell(Center(child: Text(student['studentName']))),
            DataCell(Center(child: Text(student['classCode']))),
            DataCell(Center(child: Text(student['gender']))),
            DataCell(Center(
              child: Text(DateFormat('dd/MM/yyyy')
                  .format(DateTime.parse(student['birthDate']))),
            )),
            DataCell(
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      // Xử lý logic sửa sinh viên ở hàng tương ứng
                      // Ví dụ: editStudent(index);
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Xóa sinh viên'),
                            content: Text(
                                'Bạn có chắc chắn muốn xóa sinh viên này?'),
                            actions: [
                              TextButton(
                                child: Text('Hủy'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              TextButton(
                                child: Text('Xóa'),
                                onPressed: () {
                                  // Xử lý logic xóa sinh viên ở hàng tương ứng
                                  deleteStudent(index);
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
            // Add other cells as needed
          ],
        );
      }).toList(),
    );
  }
}
