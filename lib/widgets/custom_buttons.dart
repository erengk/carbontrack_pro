import 'package:flutter/material.dart';
import '../utils/custom_colors.dart';

class CustomButtons extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;
  final Color textColor;
  const CustomButtons({
    super.key,
    required this.onPressed,
    required this.buttonText,
    this.textColor = CustomColors.textButtonColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        buttonText,
        style: TextStyle(color: textColor),
      ),
    );
  }
}