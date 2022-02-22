import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:patient_care_app/uttils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'api/sign_up_api.dart';
import 'base_controller.dart';
import 'bottom_navigator.dart';
import 'model/sign_up_model.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isRememberMe = false;
  bool hidePassword = false;
  SignUpRequest signUpRequest;
  BaseController baseController;

  @override
  void initState() {
    signUpRequest = SignUpRequest();
    baseController = BaseController(context, () {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //build Email
    Widget buildEmail() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Email',
            style: TextStyle(fontSize: 12, color: Colors.black),
          ),
          Container(
            alignment: Alignment.centerLeft,
            decoration: const BoxDecoration(),
            height: 60,
            child: TextFormField(
              validator: (val) {
                if (val.isEmpty) {
                  return "Email cannot be empty";
                } else {
                  return null;
                }
              },
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              style: const TextStyle(
                color: Colors.black87,
              ),
              decoration: const InputDecoration(
                prefixIcon: Icon(
                  Icons.email,
                  color: Colors.black12,
                ),
                hintText: 'Email',
              ),
            ),
          ),
        ],
      );
    }

    //build password
    Widget buildpassword() {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Password',
            style: TextStyle(fontSize: 12, color: Colors.black),
          ),
          SizedBox(
            height: 60,
            child: TextFormField(
              validator: (val) {
                if (val.isEmpty ) {
                  return "Email cannot be empty";
                } else {
                  return null;
                }
              },
              controller: passwordController,
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
                suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        hidePassword = !hidePassword;
                      });
                    },
                    child: Icon((hidePassword)
                        ? Icons.visibility_off
                        : Icons.visibility)),
                hintText: 'Password',
              ),
            ),
          ),
        ],
      );
    }

    //build forget password
    Widget buildForgotPassword() {
      return GestureDetector(
        onTap: () => debugPrint('forgetPassword is pressed'),
        child: const Text(
          'Forgot password?',
          style: TextStyle(color: Color(0xFFB0B0B0)),
        ),
      );
    }

    //build remember me
    Widget rememberMe() {
      return Row(
        children: [
          SizedBox(
            height: 24,
            width: 24,
            child: Checkbox(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                checkColor: const Color(0xFF1D3557),
                activeColor: Colors.white12,
                value: isRememberMe,
                onChanged: (i) {
                  setState(() {
                    isRememberMe = !isRememberMe;
                  });
                }),
          ),
          GestureDetector(
            onTap: () => debugPrint('forgetPassword is pressed'),
            child: const Text(
              'Remember Me?',
              style: TextStyle(color: Color(0xFFB0B0B0)),
            ),
          ),
        ],
      );
    }

    //main page
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
            'Sign up to\nPatient Care App ',
            style: kTextHeadingStyle,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 30,
          ),
          buildEmail(),
          const SizedBox(
            height: 30,
          ),
          buildpassword(),
          Row(
            children: [
              rememberMe(),
              const Spacer(),
              buildForgotPassword(),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Button(
            text: 'Get Started',
            onpressed: () async {
              baseController.showProgress();
              await Apiservice().APIService(
                  email: emailController.text,
                  password: passwordController.text,
                  context: context);
              baseController.hideProgress();
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.setString('Email', emailController.text);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) =>const  BottomNavigator()));
            },
          ),
          const SizedBox(
            height: 60,
          ),
          const Text(
            '-Or Scan your Fingerprint',
            style: TextStyle(fontSize: 15),
          ),
          const SizedBox(
            height: 18,
          ),
          SvgPicture.asset('assets/icons/fingerPrint.svg')
        ],
      ),
    ));
  }
}
