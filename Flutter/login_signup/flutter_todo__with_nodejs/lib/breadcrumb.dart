import 'package:flutter/material.dart';
import 'package:flutter_todo_app/provider/appState.dart';
import 'package:flutter_todo_app/students/formAddStudent.dart';
import 'package:provider/provider.dart';

class Breadcrumb extends StatefulWidget {
  Breadcrumb({super.key});

  @override
  State<Breadcrumb> createState() => _BreadcrumbState();
}

class _BreadcrumbState extends State<Breadcrumb> {
  TextEditingController _studentCodeController = TextEditingController();
  TextEditingController _studentNameController = TextEditingController();
  TextEditingController _genderController = TextEditingController();
  TextEditingController _dobController = TextEditingController();
  TextEditingController _classCodeController = TextEditingController();
  bool _isAddStudentPopupVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Trang chủ > ${context.watch<AppStateProvider>().appState?.breadcrumbs}',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                      _isAddStudentPopupVisible = true;
                    });
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.green, // Đổi màu xanh cho nút
                padding: EdgeInsets.all(16.0), // Tăng kích thước của nút
              ),
              child: Text('Thêm'),
              
            ),
          ],
        ),
        if (_isAddStudentPopupVisible) FutureBuilder<void>(
          future: _showAddStudentPopup(context),
          builder: (context, snapshot) {
            return Container();
          },
        ),
      ],
    );
  }

  Future<void> _showAddStudentPopup(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Thêm Sinh Viên'),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: _studentCodeController,
                  decoration: InputDecoration(labelText: 'Mã Sinh Viên'),
                ),
                TextFormField(
                  controller: _studentNameController,
                  decoration: InputDecoration(labelText: 'Tên Sinh Viên'),
                ),
                TextFormField(
                  controller: _genderController,
                  decoration: InputDecoration(labelText: 'Giới Tính'),
                ),
                TextFormField(
                  controller: _dobController,
                  decoration: InputDecoration(labelText: 'Ngày Sinh'),
                ),
                TextFormField(
                  controller: _classCodeController,
                  decoration: InputDecoration(labelText: 'Mã Lớp'),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  _isAddStudentPopupVisible = false;
                });
              },
              child: Text('Hủy'),
            ),
            TextButton(
              onPressed: () {
                // Xử lý thêm sinh viên ở đây
                String studentCode = _studentCodeController.text;
                String studentName = _studentNameController.text;
                String gender = _genderController.text;
                String dob = _dobController.text;
                String classCode = _classCodeController.text;

                // Thực hiện xử lý thêm sinh viên, ví dụ lưu vào cơ sở dữ liệu
                // ...

                // Đóng popup
                Navigator.of(context).pop();
                setState(() {
                  _isAddStudentPopupVisible = false;
                });
              },
              child: Text('Thêm'),
            ),
          ],
        );
      },
    );
  }
}
