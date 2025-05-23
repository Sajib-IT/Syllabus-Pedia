import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? textColor;
  final EdgeInsetsGeometry? padding;
  final double? fontSize;
  final double? borderRadius;
  final IconData? icon;

  const CustomElevatedButton(
      {required this.text,
      this.onPressed,
      this.backgroundColor,
      this.borderColor,
      this.textColor,
      this.padding,
      this.fontSize,
      this.borderRadius,
      this.icon});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor:
            backgroundColor ?? Colors.blue.shade300, // Default background color
        padding: padding ??
            const EdgeInsets.symmetric(
                horizontal: 24.0, vertical: 12.0), // Default padding
        shape: RoundedRectangleBorder(side: BorderSide(color:borderColor ?? Colors.transparent),
          borderRadius: BorderRadius.circular(
              borderRadius ?? 20.0), // Default border radius
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon != null ? Icon(icon) : const SizedBox(),
          Text(
            text,
            style: TextStyle(
              color: textColor ?? Colors.white, // Default text color
              fontSize: fontSize ?? 16.0, // Default font size
            ),
          ),
        ],
      ),
    );
  }
}
