import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//**************************************************
class BaseController //**************************************************
{
  final BuildContext _context;
  BuildContext _dialogContext;
  Function onStateChange;

  //**************************************************
  BaseController(this._context, this.onStateChange);

  //**************************************************

  //**************************************************
  void dismissKeyBoard()
  //**************************************************
  {
    // FocusScope.of(_context).requestFocus(FocusNode());
  }

  //**************************************************
  void showProgress()
  //**************************************************
  {
    showDialog(
        context: _context,
        barrierDismissible: false,
        builder: (_context) {
          _dialogContext = _context;
          return AlertDialog(
              title: Column(
            children: [
              Row(
                children: [
                  NativeProgress(showNative: true),
                  const SizedBox(width: 20),
                  const Text("Loading...."),
                ],
              )
            ],
          ));
        });
  }

  //**************************************************
  void hideProgress()
  //**************************************************
  {
    try {
      if (_dialogContext != null) Navigator.pop(_dialogContext);
    } catch (E) {}
  }
}
class NativeProgress extends StatelessWidget {
  bool showNative;

  NativeProgress({Key key, this.showNative = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform?.isAndroid ?? true
        ? showNative
        ? const CircularProgressIndicator()
        : const  CupertinoActivityIndicator()
        : Theme(
        data: ThemeData(
            cupertinoOverrideTheme: const CupertinoThemeData(
                brightness: Brightness.light,
                primaryColor: Colors.white,
                barBackgroundColor: Colors.white)),
        child: const CupertinoActivityIndicator());
  }
}