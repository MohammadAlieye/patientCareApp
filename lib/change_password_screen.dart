
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:patient_care_app/base_controller.dart';
import 'package:patient_care_app/uttils/constants.dart';
import 'api/reset_password_api.dart';
import 'model/reset_password_model.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key key}) : super(key: key);

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  BaseController baseController;
  ChangePasswordRequest changePasswordRequest;

  @override
  void initState() {
    changePasswordRequest  = ChangePasswordRequest();
    baseController = BaseController(context, (){});
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    Widget newBuildPassword(
        {String fieldName, TextEditingController controller, String hintText}) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            fieldName,
            style: const TextStyle(fontSize: 12, color: Colors.black),
          ),
          SizedBox(
            height: 60,
            child: TextFormField(
              validator: (val) {
                if (val.isEmpty || val.length >= 8) {
                  return "Email cannot be empty";
                } else {
                  return null;
                }
              },
              controller: controller,
              maxLength: 8,
              obscureText: true,
              style: const TextStyle(
                fontSize: 17,
                color: Colors.black87,
              ),
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.lock,
                  color: Colors.black12,
                ),
                hintText: hintText,
              ),
            ),
          ),
        ],
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 80),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/icons/splash_screen_logo.svg',
              width: 75,
              height: 75,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Change Your\nPassword ',
              style: kTextHeadingStyle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            newBuildPassword(
                fieldName: 'Current Password',
                controller: oldPasswordController,
                hintText: 'Current Password'),
            const SizedBox(
              height: 30,
            ),
            newBuildPassword(
                fieldName: 'New Password',
                controller: passwordController,
                hintText: 'New Password'),
            const SizedBox(
              height: 30,
            ),
            newBuildPassword(
                fieldName: 'Confirm Password',
                controller: confirmPasswordController,
                hintText: 'Confirm Password'),
            const SizedBox(
              height: 30,
            ),
            Button(
              text: 'Change Password',
              onpressed: () {
                baseController.showProgress();
                ResetPasswordApiClass().resetPasswordApiMethod(
                    currentPassword: oldPasswordController.text,
                    newPassword: passwordController.text,
                    confirmPassword: confirmPasswordController.text,
                    context: context);
                baseController.hideProgress();
                showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: const Text('are you sure'),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              'yes',
                              style: TextStyle(fontSize: 20),
                            )),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              'no',
                              style: TextStyle(fontSize: 20),
                            )),

                      ],

                    ),);
                // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>BottomNavigator()), (route) => false);
              },
            ),
          ],
        ),
      ),
    );
  }
}
