import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syllabus_pedia/view/course_name/course_name_controller.dart';
import 'package:syllabus_pedia/view/course_name/widget/course_name_widget.dart';
import 'package:syllabus_pedia/widgets/ui_helper/ui_helper.dart';

class CourseNameView extends StatelessWidget {
  final CourseNameController _controller = Get.put(CourseNameController());
  CourseNameView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: UIHelper().drawAppbarTitle(title: "Course Name List"),
      ),
      body: Column(
        children: List.generate(
            _controller.allCourseNameList.length,
            (index) => CourseNameWidget(
                courseNameList: _controller.allCourseNameList[index])),
      ),
    );
  }
}
