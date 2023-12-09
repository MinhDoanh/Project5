import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/dashboard.dart';
import 'package:flutter_app/loginPage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(MyApp(token: prefs.getString('token'),));
}

class MyApp extends StatelessWidget {
  final token;
   const MyApp({super.key, @required this.token});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: (!JwtDecoder.isExpired(token)) ? Dashboard(token: token) : const LoginPage(),
    );
  }
}
