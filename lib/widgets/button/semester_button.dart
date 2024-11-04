import 'package:flutter/material.dart';

class SemesterButton extends StatelessWidget {
  final String text;
  final FontWeight? fontWeight;
  final VoidCallback? onTab;
  const SemesterButton(
      {super.key, required this.text, this.onTab, this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: InkWell(
        onTap: onTab,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blueAccent.shade100),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 17,
              fontWeight: fontWeight ?? FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
