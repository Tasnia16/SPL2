import 'package:flutter/material.dart';
import 'package:flutterproject/Accounts/HomePage.dart';
import 'package:flutterproject/DASH/dashboard.dart';
import 'package:flutterproject/Dashboard2/dash2.dart';
import 'package:flutterproject/Accounts/Sign_Up.dart';
import 'package:flutterproject/model/User.dart';
import "package:http/http.dart" as http;

class UserProvider extends ChangeNotifier {
  User _user = User(
    id:'',
    username:'',
    email:'',
    UniversityRegistrationID:'',
    password:'',
    PhoneNumber:'',
    bKashNumber:'',
    currentBsseYear:'',
      token:''

  );

  User get user => _user;

  void setUser(String user) {
    _user = User.fromJson(user);
    notifyListeners();
  }

  void setUserFromModel(User user) {
    _user = user;
    notifyListeners();
  }
}