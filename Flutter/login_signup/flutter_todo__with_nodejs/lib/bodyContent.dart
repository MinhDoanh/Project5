import 'package:flutter/material.dart';
import 'package:flutter_todo_app/breadcrumb.dart';
import 'package:flutter_todo_app/constant/number.dart';

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
              child: DataTable(
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
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     IconButton(
          //       icon: Icon(Icons.arrow_back),
          //       onPressed: () {
          //         // Handle pagination: Go to the previous page
          //       },
          //     ),
          //     Text('1'),
          //     IconButton(
          //       icon: Icon(Icons.arrow_forward),
          //       onPressed: () {
          //         // Handle pagination: Go to the next page
          //       },
          //     ),
          //   ],
          // ),

          Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    IconButton(
      icon: Icon(Icons.first_page),
      onPressed: () {
        // Handle pagination: Go to the first page
      },
    ),
    IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        // Handle pagination: Go to the previous page
      },
    ),
    SizedBox(width: 10), // Khoảng cách giữa biểu tượng và số trang
    for (int i = 1; i <= 5; i++)
      Row(
        children: [
          InkWell(
            onTap: () {
              // Handle pagination: Go to page i
            },
            child: Container(
              alignment: Alignment.center,
              width: 40,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black45),
                color: i == 1 ? Colors.blue : Colors.white,
                borderRadius: BorderRadius.circular(5),
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
          SizedBox(width: 10), // Khoảng cách giữa các số trang
        ],
      ),
    SizedBox(width: 10), // Khoảng cách giữa số trang và biểu tượng
    IconButton(
      icon: Icon(Icons.arrow_forward),
      onPressed: () {
        // Handle pagination: Go to the next page
      },
    ),
    IconButton(
      icon: Icon(Icons.last_page),
      onPressed: () {
        // Handle pagination: Go to the last page
      },
    ),
  ],
),

        ],
      ),
    );
  }
}
