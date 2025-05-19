import 'package:flutter/material.dart';

class TitleValueRowWidget extends StatelessWidget {
  final String title;
  final double? titleFontSize;
  final String value;
  final double? valueFontSize;
  const TitleValueRowWidget({
    super.key,
    required this.title,
    required this.value,
    this.titleFontSize,
    this.valueFontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0,horizontal: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: titleFontSize ?? 16,
              )),
          Flexible(
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: TextStyle(
                  fontSize: valueFontSize ?? 14, fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
            ),
          ),
        ],
      ),
    );
  }
}
