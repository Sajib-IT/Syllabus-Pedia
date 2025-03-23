import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syllabus_pedia/view/course_content_details/course_content_details_view.dart';
import 'package:syllabus_pedia/view/course_name/course_name_controller.dart';
import 'package:syllabus_pedia/widgets/button/semester_button.dart';

class CourseNameWidget extends StatelessWidget {
  final CourseNameController _courseNameController = Get.find();
  final List<String> courseNameList;
  CourseNameWidget({super.key, required this.courseNameList});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: List.generate(
          courseNameList.length,
          (index) => SemesterButton(
                text: courseNameList[index],
                isCenter: false,
                onTab: () {
                  Get.to(
                      () => CourseContentDetailsView(
                          appTittle: courseNameList[index]),
                      arguments: [
                        courseNameList[index],
                        _courseNameController.semesterName
                      ]);
                },
                onEdit: () {},
                onDelete: () {},
              )),
    );
  }
}
