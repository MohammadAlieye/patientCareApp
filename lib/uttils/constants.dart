import 'package:flutter/material.dart';
import 'colors.dart';

const kTextHeadingStyle = TextStyle(
  color: kdarkBlue,
  fontWeight: FontWeight.bold,
  fontSize: 28,
);

const kTextparagraphStyle = TextStyle(
  color: Color(0xFF457B9D),
  fontSize: 13,
);

// Button class
class Button extends StatefulWidget {
  final text;
  final onpressed;
  const Button({Key key, this.text, this.onpressed }) : super(key: key);

  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 312,
      height: 55,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF457B9D), Color(0xFF1D3557)]),
      ),
      child: TextButton(
        onPressed: widget.onpressed,
        child: Text(
          widget.text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
