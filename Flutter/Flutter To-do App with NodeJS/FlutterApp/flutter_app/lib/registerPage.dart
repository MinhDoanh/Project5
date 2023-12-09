import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/loginPage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_app/config/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isNotValidate = false;
  late SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    initSharedpref();
  }

  void initSharedpref() async {
    prefs = await SharedPreferences. getInstance();
  }
  
  
  void registerUser() async {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      var regBody = {
        "email": emailController.text,
        "password": passwordController.text,
      };
      print(regBody);

      var response = await http.post(Uri.http(url, registrationRouter),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(regBody));

      print(jsonEncode(response.body));
    } else {
      setState(() {
        _isNotValidate = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Authentication Page'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                  errorStyle: TextStyle(color: Colors.white),
                  hintText: "Email",
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                  errorStyle: TextStyle(color: Colors.white),
                  hintText: "Password",
                ),
                obscureText: true,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  // Implement your registration logic here
                  registerUser();
                },
                child: const Text('Register'),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  // Implement your login logic here
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const LoginPage()), (route) => route.isCurrent);
                },
                child: const Text('To login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}