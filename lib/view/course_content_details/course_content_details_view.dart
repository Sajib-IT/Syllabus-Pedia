import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syllabus_pedia/view/course_content_details/course_content_details_controller.dart';
import 'package:syllabus_pedia/view/course_content_details/widget/course_content_details_widget.dart';
import 'package:syllabus_pedia/widgets/ui_helper/ui_helper.dart';

class CourseContentDetailsView extends StatelessWidget {
  final CourseContentDetailsController _controller =
      Get.put(CourseContentDetailsController());
  CourseContentDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: UIHelper().drawAppbarTitle(title: "Course Content Details")),
      body: Column(
        children: List.generate(_controller.allCourseContentDetailsList.length,
            (index) {
          return CourseContentDetailsWidget(
              courseContentDetails:
                  _controller.allCourseContentDetailsList[index]);
        }),
      ),
    );
  }
}
