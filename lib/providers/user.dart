import 'package:flutter/material.dart';

class UserInfo with ChangeNotifier {
  int uid = 0;

  String _firstName = "";
  String _lastName = "";
  String _email = "";

  String get firstName {
    return _firstName;
  }

  String get lastName {
    return _lastName;
  }

  String get email {
    return _email;
  }

  set firstName(String firstName) {
    _firstName = firstName;
    notifyListeners();
  }

  set lastName(String lastName) {
    _lastName = lastName;
    notifyListeners();
  }

  set email(String email) {
    _email = email;
    notifyListeners();
  }
}
