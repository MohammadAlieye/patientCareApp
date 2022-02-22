import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class CallScreen extends StatefulWidget {
  const CallScreen({Key key}) : super(key: key);

  @override
  _CallScreenState createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  bool changeIcon = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,

        children: [
          Flexible(
            fit: FlexFit.tight,
            flex: 10,
            child: Image.asset('assets/images/content.png',width: double.infinity,),),
          const SizedBox(
            height: 30,
          ),
          Flexible(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:[
                GestureDetector(
                  onTap: (){
                    setState(() {
                    changeIcon = !changeIcon;
                    });
                  },
                    child: changeIcon  ? SvgPicture.asset('assets/icons/mic.svg') : SvgPicture.asset('assets/icons/speaker.svg')),
                SvgPicture.asset('assets/icons/callDecline.svg'),
                SvgPicture.asset('assets/icons/speaker.svg'),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),

          ],
      ),
    );
  }
}
