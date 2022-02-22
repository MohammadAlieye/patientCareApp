import 'dart:io';

import 'package:http/http.dart' as http;


class fetchApiForPatientClass{

  Future<http.Response> fetchApiForPatientMethod() async {
    try {
      final response = await http.get(
        Uri.parse('http://18.234.202.188/nursing/web/api/v1/patients'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization':'Bearer 9f67923bb8ab6c8dfafa3a382862b8f9',
        },
      );

      return response;

    } on SocketException catch(_){
      throw Exception('Failed to create album.');
    }
  }
}