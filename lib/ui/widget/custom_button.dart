import 'package:flutter/material.dart';

import '../../shared/theme.dart';


class CustomButton extends StatelessWidget {

  final String  title;
  final double width;
  final double heigt;
  final Function() onPressed;
  final EdgeInsets margin;

  const CustomButton({super.key,
    required this.title,
     this.width = double.infinity,
    required this.onPressed,
    this.margin = EdgeInsets.zero, required this.heigt});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: heigt,
      margin: margin,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
            backgroundColor: kBtColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(17)
            )
        ),
        child: Text(
          title,
          style: blackTextStyle,
        ),
      ),
    );
  }
}