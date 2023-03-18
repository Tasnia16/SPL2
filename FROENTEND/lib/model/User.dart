
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterproject/Accounts/Sign_Up.dart';
import 'package:flutterproject/Accounts/Login.dart';
import "package:http/http.dart" as http;
import 'package:flutterproject/Dashboard2/dash2.dart';

class User{
  final String id;
  final String username;
  final String email;
  final String UniversityRegistrationID;
  final String password;
  //final String password2;
  final String PhoneNumber;
  final String bKashNumber;
  final String currentBsseYear;
  final String token;

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.UniversityRegistrationID,
    required this.password,
   // required this.password2,
    required this.PhoneNumber,
    required this.bKashNumber,
    required this.currentBsseYear,
    required this.token,
  });

  Map<String, dynamic> toMap() {
    return {
      'id':id,
      'username': username,
      'email': email,
      'UniversityRegistrationID':UniversityRegistrationID,
      'password': password,
      'PhoneNumber':PhoneNumber,
      'bKashNumber':bKashNumber,
      'currentBsseYear':currentBsseYear,
      'token': token,
    };
  }


  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['_id'] ?? '',
      username: map['username'] ?? '',
      UniversityRegistrationID: map['UniversityRegistrationID'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      PhoneNumber: map['PhoneNumber'] ?? '',
      bKashNumber: map['bKashNumber'] ?? '',
      currentBsseYear: map['currentBsseYear'] ?? '',
      token: map['token'] ?? '',

    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  User copyWith({
    String? id,
    String? username,
    String? UniversityRegistrationID,
    String? email,
    String? password,
    String?PhoneNumber,
    String? bKashNumber,
    String? currentBsseYear,
    String? token

  }) {
    return User(
        id: id ?? this.id,
        username: username ?? this.username,
        email: email ?? this.email,
      UniversityRegistrationID: UniversityRegistrationID ?? this.UniversityRegistrationID,
      password: password ?? this.password,
      PhoneNumber: PhoneNumber ?? this.PhoneNumber,
      bKashNumber: bKashNumber ?? this.bKashNumber,
      currentBsseYear: currentBsseYear ?? this.currentBsseYear,
      token: token ?? this.token,
    );
  }
}
