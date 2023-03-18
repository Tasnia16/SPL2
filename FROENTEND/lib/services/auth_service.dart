import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterproject/main.dart';
import 'package:flutterproject/Accounts/Sign_Up.dart';
import 'package:flutterproject/Accounts/Login.dart';
import "package:http/http.dart" as http;
import 'package:flutterproject/Dashboard2/dash2.dart';
import 'package:flutterproject/model/User.dart';
import 'package:flutterproject/constants/httpErrorHandle.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/utils.dart';
import '../user_provider.dart';


class AuthService {
  late http.Response res;
  // sign up user
  void signUpUser({

    required BuildContext context,
    required String username,
    required String email,
    required String UniversityRegistrationID,
    required String password,
    //required String password2,
    required String PhoneNumber,
    required String bKashNumber,
    required String currentBsseYear,
  }) async {
    try {
      User user = User(
          id: '',
          username: username,
          email: email,
          UniversityRegistrationID:UniversityRegistrationID,
          password: password,
          //password2: password2,
          PhoneNumber:PhoneNumber,
          bKashNumber:bKashNumber,
          currentBsseYear:currentBsseYear,
          token: '',
      );
      print(user.toJson());
      // http.Response
      res = await http.post(
        Uri.parse('$uri/user/new'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      print(res.statusCode);
      print(res.body);

      // var myuser= {
      //   "token" : jsonDecode(res.body).token
      // };
      // print(myuser);




      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () async {
          showSnackBar(context, jsonDecode(res.body)['message'],);
          await Future.delayed(Duration(seconds: 2));
         Navigator.push(context, MaterialPageRoute(builder:(context)=>Login()),);
        },
      );
    } catch (e) {
      //showSnackBar(context, e.toString());
     // print(jsonDecode(res.body)['message']);
      showSnackBar(context, jsonDecode(res.body)['message']);
    }
  }

  // sign in user
  void signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/user/login'),
        body: jsonEncode({
          'username': email,
          'password': password,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      print(res.body);
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () async {

          SharedPreferences prefs = await SharedPreferences.getInstance();
           Provider.of<UserProvider>(context, listen: false).setUser(res.body);
          await prefs.setString('x-auth-token', jsonDecode(res.body)['token']);

          //  final user=Provider.of<UserProvider>(context).user;
          // print(user);
          //Navigator.pushNamedAndRemoveUntil(context, '/dashboard' , (route) => false,);
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
              MenuDashboardPage()), (Route<dynamic> route) => false);
        //  Navigator.push(context, MaterialPageRoute(builder:(context)=>MenuDashboardPage()),);
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }

  }

  // get user data
  void getUserData(
      BuildContext context,
      ) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');

      if (token == null) {
        prefs.setString('x-auth-token', '');
      }

      var tokenRes = await http.post(
        Uri.parse('$uri/tokenIsValid'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': token!
        },
      );

      var response = jsonDecode(tokenRes.body);

      if (response == true) {
        http.Response userRes = await http.get(
          Uri.parse('$uri/'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': token
          },
        );

        var userProvider = Provider.of<UserProvider>(context, listen: false);
        userProvider.setUser(userRes.body);
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}