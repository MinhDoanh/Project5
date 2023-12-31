import 'package:flutter/material.dart';
import 'package:flutter_todo_app/accountDropdown.dart';
import 'package:flutter_todo_app/bodyContent.dart';
import 'package:flutter_todo_app/constant/number.dart';
import 'package:flutter_todo_app/provider/appState.dart';
import 'package:flutter_todo_app/sideBar.dart';
import 'package:provider/provider.dart';


class Dashboard extends StatefulWidget {
  final token;
  const Dashboard({@required this.token, Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late String userName;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    AppState appState = AppState(breadcrumbs: 'Quản lý lịch học',students: []);
    Provider.of<AppStateProvider>(context, listen: false).setAppState(appState);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: appBarHeight,
        title: Row(
          children: [
            Image.asset('assets/images/logo-fit-utehy.png', width: 25,),
            SizedBox(width: 10,),
            Text(
                'Hệ thống quản lý điểm danh sinh viên Khoa Công nghệ thông tin'
                    .toUpperCase()),
          ],
        ),
        actions: [
          AccountDropdown(),
        ],
      ),
      body: Row(
        children: [Sidebar(), BodyContent()],
      ),
    );
  }
}

// class Dashboard extends StatefulWidget {
//   final token;
//   const Dashboard({@required this.token, Key? key}) : super(key: key);

//   @override
//   State<Dashboard> createState() => _DashboardState();
// }

// class _DashboardState extends State<Dashboard> {
//   late String userId;
//   TextEditingController _todoTitle = TextEditingController();
//   TextEditingController _todoDesc = TextEditingController();
//   List? items;
//   late SharedPreferences prefs;

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     Map<String, dynamic> jwtDecodedToken = JwtDecoder.decode(widget.token);
//     initSharedPref();

//     userId = jwtDecodedToken['_id'];
//     getTodoList(userId);
//   }

//   void addTodo() async {
//     if (_todoTitle.text.isNotEmpty && _todoDesc.text.isNotEmpty) {
//       var regBody = {
//         "userId": userId,
//         "title": _todoTitle.text,
//         "desc": _todoDesc.text
//       };

//       var response = await http.post(Uri.http(url, addtodo),
//           headers: {"Content-Type": "application/json"},
//           body: jsonEncode(regBody));

//       var jsonResponse = jsonDecode(response.body);

//       print(jsonResponse['status']);

//       if (jsonResponse['status']) {
//         _todoDesc.clear();
//         _todoTitle.clear();
//         Navigator.pop(context);
//         getTodoList(userId);
//       } else {
//         print("SomeThing Went Wrong");
//       }
//     }
//   }

//   void getTodoList(userId) async {
//     var regBody = {"userId": userId};

//     var response = await http.get(
//       Uri.http(url, getToDoList, regBody),
//       headers: {"Content-Type": "application/json"},
//       // body: jsonEncode(regBody)
//     );

//     var jsonResponse = jsonDecode(response.body);
//     items = jsonResponse['success'];
//     print(items);

//     setState(() {});
//   }

//   void deleteItem(id) async {
//     var regBody = {"id": id};

//     var response = await http.post(Uri.http(url, deleteTodo),
//         headers: {"Content-Type": "application/json"},
//         body: jsonEncode(regBody));

//     var jsonResponse = jsonDecode(response.body);
//     if (jsonResponse['status']) {
//       getTodoList(userId);
//     }
//   }

//   void initSharedPref() async {
//     prefs = await SharedPreferences.getInstance();
//   }

//   void logoutUser() {
//   // Xóa token khỏi SharedPreferences
//   prefs.remove('token');

//   // Chuyển người dùng về màn hình đăng nhập hoặc màn hình chào mừng
//   Navigator.pushReplacement(
//     context,
//     MaterialPageRoute(builder: (context) => SignInPage()), // Thay WelcomeScreen bằng tên màn hình tương ứng
//   );
// }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.lightBlueAccent,
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             padding: EdgeInsets.only(
//                 top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   children: [
//                     CircleAvatar(
//                       child: Icon(
//                         Icons.list,
//                         size: 30.0,
//                       ),
//                       backgroundColor: Colors.white,
//                       radius: 30.0,
//                     ),
//                     IconButton(
//                       icon: Icon(Icons.exit_to_app),
//                       onPressed: () {
//                         logoutUser();
//                       },
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 10.0),
//                 Text(
//                   'ToDo with NodeJS + Mongodb',
//                   style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w700),
//                 ),
//                 SizedBox(height: 8.0),
//                 Text(
//                   '5 Task',
//                   style: TextStyle(fontSize: 20),
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//             child: Container(
//               decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(20),
//                       topRight: Radius.circular(20))),
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: items == null
//                     ? null
//                     : ListView.builder(
//                         itemCount: items!.length,
//                         itemBuilder: (context, int index) {
//                           return Slidable(
//                             // key: const ValueKey(0),
//                             key: UniqueKey(),
//                             endActionPane: ActionPane(
//                               motion: const ScrollMotion(),
//                               dismissible: DismissiblePane(onDismissed: () {
//                                 deleteItem(items![index]['_id']);
//                               }),
//                               children: [
//                                 SlidableAction(
//                                   backgroundColor: Color(0xFFFE4A49),
//                                   foregroundColor: Colors.white,
//                                   icon: Icons.delete,
//                                   label: 'Delete',
//                                   onPressed: (BuildContext context) {
//                                     print('${items![index]['_id']}');
//                                     deleteItem('${items![index]['_id']}');
//                                   },
//                                 ),
//                               ],
//                             ),
//                             child: Card(
//                               borderOnForeground: false,
//                               child: ListTile(
//                                 leading: Icon(Icons.task),
//                                 title: Text('${items![index]['title']}'),
//                                 subtitle:
//                                     Text('${items![index]['description']}'),
//                                 trailing: Icon(Icons.arrow_back),
//                               ),
//                             ),
//                           );
//                         }),
//               ),
//             ),
//           )
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => _displayTextInputDialog(context),
//         child: Icon(Icons.add),
//         tooltip: 'Add-ToDo',
//       ),
//     );
//   }

//   Future<void> _displayTextInputDialog(BuildContext context) async {
//     return showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//               title: Text('Add To-Do'),
//               content: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   TextField(
//                     controller: _todoTitle,
//                     keyboardType: TextInputType.text,
//                     decoration: InputDecoration(
//                         filled: true,
//                         fillColor: Colors.white,
//                         hintText: "Title",
//                         border: OutlineInputBorder(
//                             borderRadius:
//                                 BorderRadius.all(Radius.circular(10.0)))),
//                   ).p4().px8(),
//                   TextField(
//                     controller: _todoDesc,
//                     keyboardType: TextInputType.text,
//                     decoration: InputDecoration(
//                         filled: true,
//                         fillColor: Colors.white,
//                         hintText: "Description",
//                         border: OutlineInputBorder(
//                             borderRadius:
//                                 BorderRadius.all(Radius.circular(10.0)))),
//                   ).p4().px8(),
//                   ElevatedButton(
//                       onPressed: () {
//                         addTodo();
//                       },
//                       child: Text("Add"))
//                 ],
//               ));
//         });
//   }
// }






