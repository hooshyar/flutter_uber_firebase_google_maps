import 'package:flutter/material.dart';
import 'package:flutter_firebase_uber/src/style.dart';

class GeneralButton extends StatelessWidget {
  const GeneralButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      this.color,
      this.width})
      : super(key: key);
  final String text;
  final dynamic onPressed;
  final double? width;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: MaterialButton(
          child: Text(
            text,
            style: const TextStyle(
                fontWeight: FontWeight.w800, color: Colors.white, fontSize: 14),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
          minWidth: width ?? 190,
          height: 50,
          color: color ?? mainColor,
          onPressed: onPressed),
    );
  }
}
