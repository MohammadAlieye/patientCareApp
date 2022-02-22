
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:patient_care_app/onboardingScreens/onbording_screens.dart';
import 'package:patient_care_app/uttils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../bottom_navigator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  String loggedIn;

  Future getValidationData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var prefData = preferences.getString('Email');
    setState(() {
      loggedIn = prefData;

    });
  }

  @override
  void initState() {
    getValidationData().whenComplete(
      () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  loggedIn == null ? const OnBoardingScreens() : const BottomNavigator())),
    );
    Future.delayed(const Duration(seconds: 2), () {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/icons/splash_screen_logo.svg'),
              const SizedBox(
                height: 30.0,
              ),
              const Text(
                'Patient Care App',
                style: kTextHeadingStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
