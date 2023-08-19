import 'package:flutter/material.dart';

import '../../shared/theme.dart';


class CustomTextFromField extends StatelessWidget {

  final String title;
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;


  const CustomTextFromField({super.key,
    required this.title,
    required this.hintText,
    this.obscureText = false,
    required this.controller, });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              title,
          ),
          const SizedBox(
            height: 6,
          ),
          TextFormField(
            cursorColor: kBlackColor,
            obscureText: obscureText,
            controller: controller,
            decoration: InputDecoration(
                hintText: hintText,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(17)
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(17),
                    borderSide: BorderSide(
                      color: kPrimaryColor,
                    )
                )
            ),
          ),
        ],

      ),
    );
  }
}
