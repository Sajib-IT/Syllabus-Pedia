import 'package:flutter/material.dart';

class ElementDetailsWidget extends StatelessWidget {
  final MapEntry<String, String> element;
  const ElementDetailsWidget({super.key, required this.element});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SelectableText(
            "${element.key} :",
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 8),
          SelectableText(
            element.value,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            onSelectionChanged: (textSelection, cause) {
              final select = element.value
                  .substring(textSelection.start, textSelection.end);
              print(select);
            },
            toolbarOptions: ToolbarOptions(),
          ),
        ],
      ),
    );
  }
}
