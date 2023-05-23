import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/constants.dart';

/// ButtonType enum
enum ButtonType {
  /// Primary button design
  primary,

  /// Plain button design
  plain,
}

/// AppButton widget
class AppButton extends StatelessWidget {
  /// AppButton type (ButtonType enum)
  final ButtonType type;

  /// onPressed function
  final VoidCallback onPressed;

  /// Button text
  final String text;

  /// AppButton constructor
  AppButton({
    required this.type,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: 60.h,
        decoration: BoxDecoration(
          color: getButtonColor(type),
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(169, 176, 185, 0.42),
              spreadRadius: 0,
              blurRadius: 8.0,
              offset: Offset(0, 2),
            )
          ],
        ),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.roboto(
              color: getTextColor(type),
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}

/// Get button color by type (ButtonType enum)
Color getButtonColor(ButtonType type) {
  switch (type) {
    case ButtonType.primary:
      return Constants.primaryColor;
    case ButtonType.plain:
      return Colors.white;
    default:
      return Constants.primaryColor;
  }
}

/// Get button text color by type (ButtonType enum)
Color getTextColor(ButtonType type) {
  switch (type) {
    case ButtonType.plain:
      return Constants.primaryColor;
    case ButtonType.primary:
      return Colors.white;
    default:
      return Colors.white;
  }
}
