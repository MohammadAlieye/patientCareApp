import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

class FetchApiForAlamrs {

  Future<http.Response> fetchApi() async {

    try {
      //get the api though this link and with header
      final response = await http.get(
        Uri.parse('http://18.234.202.188/nursing/web/api/v1/alarms'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization':'Bearer 9f67923bb8ab6c8dfafa3a382862b8f9',
        },

      );
      return response;

      //check for internet connection
    } on SocketException catch(_){
      throw Exception('Failed to create album.');
    }
  }
}
