import 'dart:developer';
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
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
            onSelectionChanged: (textSelection, cause) {
              final select =
                  element.key.substring(textSelection.start, textSelection.end);
              _controller.selectedText.value = select;
              _controller.searchController.text = _controller.selectedText.value;
            },
            // toolbarOptions: ToolbarOptions()
          ),
          const SizedBox(height: 8),
          SelectableText(
            element.value,
            strutStyle: const StrutStyle(fontSize: 20),
            textAlign: TextAlign.justify,
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
            onSelectionChanged: (textSelection, cause) {
              final select = element.value
                  .substring(textSelection.start, textSelection.end);
              log(select);
              _controller.selectedText.value = select;
              _controller.searchController.text = _controller.selectedText.value;
            },
            // toolbarOptions: ToolbarOptions(),
          ),
        ],
      ),
    );
  }
}
