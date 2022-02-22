import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:patient_care_app/model/sign_up_model.dart';

class Apiservice {
  Future<dynamic> APIService(
      {BuildContext context, String email, String password}) async {
    final response = await http.post(
      Uri.parse('http://18.234.202.188/nursing/web/api/v1/auth/token'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),

    );


    if (response.statusCode == 200) {
      var jsonData = SignUpRequest.fromJson(json.decode(response.body));
      print('its a json data user :$jsonData');
      return jsonData;
    } else {
      throw Exception('Failed to create album.');
    }
  }
}
