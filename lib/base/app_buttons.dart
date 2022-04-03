import 'package:flutter/material.dart';

import 'app_colors.dart';

class Appbuttons {
  final appColors = AppColors();
  buildButton(Color color, String buttonText, BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.06,
      color: color,
      child: Center(
        child: Text(
          buttonText,
          style: TextStyle(
              color: appColors.whiteColor,
              fontWeight: FontWeight.w600,
              fontSize: 15),
        ),
      ),
    );
  }
}
