import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syllabus_pedia/view/course_content_details/course_content_details_controller.dart';

class ElementDetailsWidget extends StatelessWidget {
  final CourseContentDetailsController _controller = Get.find();
  final MapEntry<String, String> element;
  ElementDetailsWidget({super.key, required this.element});

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
            onSelectionChanged: (textSelection, cause) {
              final select = element.key
                  .substring(textSelection.start, textSelection.end);
              print(select);
              _controller.selectedText.value = select;
            },
              toolbarOptions: ToolbarOptions()
          ),
          const SizedBox(height: 8),
          SelectableText(
            element.value,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            onSelectionChanged: (textSelection, cause) {
              final select = element.value
                  .substring(textSelection.start, textSelection.end);
              print(select);
              _controller.selectedText.value = select;
            },
            toolbarOptions: ToolbarOptions(),
          ),
        ],
      ),
    );
  }
}
