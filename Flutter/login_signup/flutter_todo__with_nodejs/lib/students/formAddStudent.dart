// import 'package:flutter/material.dart';

// class FormAddStudent extends StatefulWidget {
//   FormAddStudent({Key? key}) : super(key: key);

//   @override
//   _FormAddStudentState createState() => _FormAddStudentState();
// }

// class _FormAddStudentState extends State<FormAddStudent> {
//   TextEditingController _studentCodeController = TextEditingController();
//   TextEditingController _studentNameController = TextEditingController();
//   TextEditingController _genderController = TextEditingController();
//   TextEditingController _dobController = TextEditingController();
//   TextEditingController _classCodeController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: () {
//         _showAddStudentPopup(context);
//       },
//       style: ElevatedButton.styleFrom(
//         primary: Colors.green, // Đổi màu xanh cho nút
//         padding: EdgeInsets.all(16.0), // Tăng kích thước của nút
//       ),
//       child: Text('Thêm'),
//     );
//   }

//   Future<void> _showAddStudentPopup(BuildContext context) async {
//     return showDialog<void>(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Thêm Sinh Viên'),
//           content: SingleChildScrollView(
//             child: Column(
//               children: <Widget>[
//                 TextFormField(
//                   controller: _studentCodeController,
//                   decoration: InputDecoration(labelText: 'Mã Sinh Viên'),
//                 ),
//                 TextFormField(
//                   controller: _studentNameController,
//                   decoration: InputDecoration(labelText: 'Tên Sinh Viên'),
//                 ),
//                 TextFormField(
//                   controller: _genderController,
//                   decoration: InputDecoration(labelText: 'Giới Tính'),
//                 ),
//                 TextFormField(
//                   controller: _dobController,
//                   decoration: InputDecoration(labelText: 'Ngày Sinh'),
//                 ),
//                 TextFormField(
//                   controller: _classCodeController,
//                   decoration: InputDecoration(labelText: 'Mã Lớp'),
//                 ),
//               ],
//             ),
//           ),
//           actions: <Widget>[
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: Text('Hủy'),
//             ),
//             TextButton(
//               onPressed: () {
//                 // Xử lý thêm sinh viên ở đây
//                 String studentCode = _studentCodeController.text;
//                 String studentName = _studentNameController.text;
//                 String gender = _genderController.text;
//                 String dob = _dobController.text;
//                 String classCode = _classCodeController.text;

//                 // Thực hiện xử lý thêm sinh viên, ví dụ lưu vào cơ sở dữ liệu
//                 // ...

//                 // Đóng popup
//                 Navigator.of(context).pop();
//               },
//               child: Text('Thêm'),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
