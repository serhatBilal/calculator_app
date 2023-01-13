import 'package:flutter/material.dart';

class ButtonCal extends StatelessWidget {
  final String text;
  final fillColor;
  final textColor;
  final double textSize;
  final Function callback;

  const ButtonCal(
      {super.key,
      required this.text,
      this.fillColor,
      this.textColor = Colors.white,
      this.textSize = 28,
      required this.callback});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: SizedBox(
        height: 65,
        width: 65,
        child: MaterialButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
          onPressed: () {
            callback(text);
          },
          // ignore: sort_child_properties_last
          child: Text(
            text,
            style: TextStyle(fontSize: textSize),
          ),
          // ignore: prefer_if_null_operators
          color: fillColor != null ? fillColor : null,
          textColor: textColor,
        ),
      ),
    );
  }
}
