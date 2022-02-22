// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

ChangePasswordRequest welcomeFromJson(String str) => ChangePasswordRequest.fromJson(json.decode(str));

String welcomeToJson(ChangePasswordRequest data) => json.encode(data.toJson());

class ChangePasswordRequest {
  ChangePasswordRequest({
    this.success,
    this.status,
    this.errorCode,
    this.endpoint,
    this.errors,
    this.line,
    this.stackTrace,
  });

  bool success;
  int status;
  String errorCode;
  String endpoint;
  List<String> errors;
  int line;
  List<String> stackTrace;

  factory ChangePasswordRequest.fromJson(Map<String, dynamic> json) => ChangePasswordRequest(
    success: json["success"],
    status: json["status"],
    errorCode: json["error_code"],
    endpoint: json["endpoint"],
    errors: List<String>.from(json["errors"].map((x) => x)),
    line: json["line"],
    stackTrace: List<String>.from(json["stack-trace"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "status": status,
    "error_code": errorCode,
    "endpoint": endpoint,
    "errors": List<dynamic>.from(errors.map((x) => x)),
    "line": line,
    "stack-trace": List<dynamic>.from(stackTrace.map((x) => x)),
  };
}
