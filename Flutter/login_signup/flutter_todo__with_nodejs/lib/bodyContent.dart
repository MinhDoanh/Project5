import 'package:flutter/material.dart';
import 'package:flutter_todo_app/breadcrumb.dart';
import 'package:flutter_todo_app/constant/number.dart';
import 'package:flutter_todo_app/constant/string.dart';
import 'package:flutter_todo_app/provider/appState.dart';
import 'package:flutter_todo_app/students/dataTableStudent.dart';
import 'package:provider/provider.dart';

class BodyContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - sideBarWidth,
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Breadcrumb(),
          SizedBox(height: 16.0),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              width: MediaQuery.of(context).size.width - sideBarWidth,
              child: context.watch<AppStateProvider>().appState?.breadcrumbs ==
                      '$quanLyDanhMuc > $danhMucSinhVien'
                  ? DataTableStudent()
                  : DataTable(
                      columns: [
                        DataColumn(
                            label: Expanded(
                                child: Text(
                          'ID',
                          textAlign: TextAlign.center,
                        ))),
                        DataColumn(
                            label: Expanded(
                                child: Text(
                          'Tên',
                          textAlign: TextAlign.center,
                        ))),
                        DataColumn(
                            label: Expanded(
                                child: Text(
                          'Ngày sinh',
                          textAlign: TextAlign.center,
                        ))),
                        // Add other columns as needed
                      ],
                      rows: [
                        DataRow(cells: [
                          DataCell(Center(child: Text('1'))),
                          DataCell(Center(child: Text('John Doe'))),
                          DataCell(Center(child: Text('1990-01-01'))),
                          // Add other cells as needed
                        ]),
                        // Add more rows as needed
                      ],
                    ),
            ),
          ),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.first_page),
                onPressed: () {
                  // Xử lý phân trang: Chuyển đến trang đầu tiên
                },
              ),
              IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  // Xử lý phân trang: Chuyển đến trang trước đó
                },
              ),
              SizedBox(width: 10),
              for (int i = 1; i <= 5; i++)
                InkWell(
                  onTap: () {
                    // Xử lý phân trang: Chuyển đến trang i
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 40,
                    height: 40,
                    margin: EdgeInsets.all(5), // Thêm margin 5px xung quanh
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black45),
                      color: i == 1 ? Colors.blue : Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Text(
                      '$i',
                      style: TextStyle(
                        fontSize: 18,
                        color: i == 1 ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ),
              SizedBox(width: 10),
              IconButton(
                icon: Icon(Icons.arrow_forward),
                onPressed: () {
                  // Xử lý phân trang: Chuyển đến trang kế tiếp
                },
              ),
              IconButton(
                icon: Icon(Icons.last_page),
                onPressed: () {
                  // Xử lý phân trang: Chuyển đến trang cuối cùng
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
