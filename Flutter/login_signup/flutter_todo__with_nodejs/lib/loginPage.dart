import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_todo_app/dashboard.dart';
import 'package:flutter_todo_app/provider/account.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'config.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController _accountController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isButtonDisabled = true;
  bool _accountClicked = false;
  bool _passwordClicked = false;
  bool _isLoggingIn = false;
  late SharedPreferences prefs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initSharedPref();
    _accountController.addListener(_checkButtonState);
    _passwordController.addListener(_checkButtonState);
  }

  void initSharedPref() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<void> loginUser() async {
    setState(() {
      _isLoggingIn = true; // Bắt đầu quá trình đăng nhập
    });

    await Future.delayed(Duration(seconds: 2));

    if (_accountController.text.isNotEmpty && _passwordController.text.isNotEmpty) {
      var reqBody = {
        "account": _accountController.text,
        "password": _passwordController.text
      };

      var response = await http.post(Uri.http(url, login),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(reqBody));

      var jsonResponse = jsonDecode(response.body);
      if (jsonResponse['status']) {
        var myToken = jsonResponse['token'];
        prefs.setString('token', myToken);
        print('In ra:' + myToken);

        Map<String, dynamic> jwtDecodedToken = JwtDecoder.decode(myToken);
        print(jwtDecodedToken);
        Account account = Account(username: jwtDecodedToken['account'], token: myToken);
        // context.read<AccountProvider>().setAccount(account);
        Provider.of<AccountProvider>(context, listen: false).setAccount(account);

        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => Dashboard(token: myToken)));
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Lỗi đăng nhập', style: TextStyle(color: Colors.red)),
              content:
                  Text(jsonResponse['error'], style: TextStyle(fontSize: 16)),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                    // Additional actions if needed
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                  ),
                  child: Text('OK', style: TextStyle(color: Colors.white)),
                ),
              ],
            );
          },
        );
      }
    }

    setState(() {
      _isLoggingIn = false; // Kết thúc quá trình đăng nhập
    });
  }

  void _checkButtonState() {
    setState(() {
      _isButtonDisabled =
          _accountController.text.isEmpty || _passwordController.text.isEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Colors.blue,
            Colors.red,
          ],
        )),
        child: Center(
          child: Container(
            width: 400,
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.white),
            child: Form(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/images/logo-fit-utehy.png',
                    width: 150,
                  ),
                  Text(
                    'Đăng nhập',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16.0),
                  _buildTextField(
                    controller: _accountController,
                    labelText: 'Tài khoản',
                    obscureText: false,
                    isClicked: _accountClicked,
                  ),
                  SizedBox(height: 16.0),
                  _buildTextField(
                    controller: _passwordController,
                    labelText: 'Mật khẩu',
                    obscureText: true,
                    isClicked: _passwordClicked,
                  ),
                  SizedBox(height: 24.0),
                  _isLoggingIn
                      ? CircularProgressIndicator()
                      : Container(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: _isButtonDisabled
                                ? null
                                : () {
                                    // Xử lý đăng nhập ở đây
                                    loginUser();
                                  },
                            child: Padding(
                              padding: EdgeInsets.only(top: 10, bottom: 10),
                              child: Text('Đăng Nhập'),
                            ),
                          ),
                        ),

                  // if (_accountController.text.isEmpty ||
                  //     _passwordController.text.isEmpty)
                  //   Padding(
                  //     padding: const EdgeInsets.all(8.0),
                  //     child: Text(
                  //       'Vui lòng điền đầy đủ tài khoản và mật khẩu.',
                  //       style: TextStyle(color: Colors.red),
                  //     ),
                  //   ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    bool obscureText = false,
    bool isClicked = false,
  }) {
    return TextFormField(
      onTap: () {
        setState(() {
          if (labelText == 'Tài khoản') {
            _accountClicked = true;
          } else if (labelText == 'Mật khẩu') {
            _passwordClicked = true;
          }
        });
      },
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        suffixIcon: !isClicked
            ? null
            : controller.text.isEmpty
                ? Tooltip(
                    message: 'Thông tin bắt buộc',
                    child: Icon(
                      Icons.error,
                      color: Colors.red,
                    ),
                    textStyle: TextStyle(color: Colors.white, fontSize: 12),
                    decoration: BoxDecoration(color: Colors.red))
                : Icon(
                    Icons.check_circle,
                    color: Colors.green,
                  ),
        suffixIconConstraints: BoxConstraints(
          maxHeight: 24,
          maxWidth: 24,
        ),
      ),
      obscureText: obscureText,
    );
  }
}