import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:patient_care_app/model/sign_up_model.dart';


class ResetPasswordApiClass {
  Future resetPasswordApiMethod(
      {BuildContext context,String currentPassword, String newPassword,String confirmPassword}) async {
    final response = await http.put(
      Uri.parse('http://18.234.202.188/nursing/web/api/v1/account/change-password'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'currentpassword':currentPassword,
         'newPassword':newPassword,
        'confirmPassord':confirmPassword
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
