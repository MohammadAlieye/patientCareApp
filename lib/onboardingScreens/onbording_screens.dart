
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:patient_care_app/uttils/constants.dart';
import '../sign_up_screen.dart';

class OnBoardingScreens extends StatefulWidget {
  const OnBoardingScreens({Key key}) : super(key: key);

  @override
  State<OnBoardingScreens> createState() => _OnBoardingScreensState();
}

class _OnBoardingScreensState extends State<OnBoardingScreens> {
  var currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            SvgPicture.asset(
              'assets/icons/splash_screen_logo.svg',
              width: 75,
              height: 75,
            ),
            const SizedBox(
              height: 21,
            ),
            const Text(
              'Patient Care App \n       Welcome!',
              style: kTextHeadingStyle,
            ),
            const SizedBox(
              height: 16,
            ),
            const SizedBox(
                width: 222,
                child: Text(
                    'Lorem ipsum dolor sit amet,   consetetur sadipscing elitr, sed',
                    style: kTextparagraphStyle)),
            Flexible(
              child: PageView(
                onPageChanged: (int index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                scrollDirection: Axis.horizontal,
                children: [
                  Image.asset('assets/images/ob1.png'),
                  Image.asset('assets/images/ob2.png'),
                ],
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  2,
                  (index) => Container(
                        height: 8,
                        width: 8,
                        margin: const EdgeInsets.only(left: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: currentIndex == index
                              ? const Color(0xFF457B9D)
                              : const Color(0xFFA8DADC),
                        ),
                      )),
            ),
            const SizedBox(
              height: 22,
            ),
            Button(
              text: 'Get Started',
              onpressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const SignUpScreen()));
              },
            ),
            const SizedBox(
              height: 22,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account?',
                  style: kTextparagraphStyle.copyWith(color: const Color(0xFFB1B1B1)),
                ),
                Text(
                  'Sign In',
                  style: kTextHeadingStyle.copyWith(
                      fontSize: 13, fontWeight: FontWeight.normal),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
