// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

SignUpRequest welcomeFromJson(String str) => SignUpRequest.fromJson(json.decode(str));

String welcomeToJson(SignUpRequest data) => json.encode(data.toJson());

class SignUpRequest {
  SignUpRequest({
    this.token,
    this.expiryDate,
    this.user,
  });

  String token;
  String expiryDate;
  User user;

  factory SignUpRequest.fromJson(Map<String, dynamic> json) => SignUpRequest(
    token: json["token"],
    expiryDate: json["expiry_date"],
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "expiry_date": expiryDate,
    "user": user.toJson(),
  };

  @override
  String toString() {
    return 'SignUpRequest{token: $token, expiryDate: $expiryDate, user: ${user.toString()}';
  }
}

class User {
  User({
    this.uuid,
    this.firstName,
    this.lastName,
    this.middleName,
  });

  String uuid;
  String firstName;
  String lastName;
  dynamic middleName;

  factory User.fromJson(Map<String, dynamic> json) => User(
    uuid: json["uuid"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    middleName: json["middle_name"],
  );

  Map<String, dynamic> toJson() => {
    "uuid": uuid,
    "first_name": firstName,
    "last_name": lastName,
    "middle_name": middleName,
  };

  @override
  String toString() {
    return 'User{uuid: $uuid, firstName: $firstName, lastName: $lastName, middleName: $middleName}';
  }
}
