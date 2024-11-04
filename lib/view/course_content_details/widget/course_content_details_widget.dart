import 'package:flutter/material.dart';
import 'package:syllabus_pedia/view/course_content_details/widget/element_details_widget.dart';

class CourseContentDetailsWidget extends StatelessWidget {
  final Map<String, String> courseContentDetails;
  const CourseContentDetailsWidget(
      {super.key, required this.courseContentDetails});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: courseContentDetails.entries.map((entry) {
      return ElementDetailsWidget(element: entry);
    }).toList());
  }
}
