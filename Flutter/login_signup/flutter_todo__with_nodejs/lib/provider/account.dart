import 'package:flutter/material.dart';

class Account {
  final String username;
  final String token;

  Account({required this.username, required this.token});
}

class AccountProvider with ChangeNotifier {
  Account? _account;

  Account? get account => _account;

  void setAccount(Account account) {
    _account = account;
    notifyListeners();
  }
}

