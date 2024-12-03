import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syllabus_pedia/view/course_name/course_name_view.dart';
import 'package:syllabus_pedia/view/semester_name/semester_name_controller.dart';
import 'package:syllabus_pedia/widgets/button/semester_button.dart';
import 'package:syllabus_pedia/widgets/ui_helper/ui_helper.dart';

class SemesterNameView extends StatelessWidget {
  final SemesterNameController _controller = Get.put(SemesterNameController());
  SemesterNameView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: UIHelper().drawAppbarTitle(title: "Semester Name List")),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: GestureDetector(
              onTap: () {
                FirebaseAuth.instance.signOut();
              },
              child: const Icon(Icons.logout),
            ),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ...List.generate(_controller.semesterNameList.length, (index) {
            return SemesterButton(
              text: _controller.semesterNameList[index],
              // fontWeight: index == 3 ? FontWeight.w800 : FontWeight.w500,
              fontWeight: FontWeight.w500,
              onTab: () {
                Get.to(() => CourseNameView(),
                    arguments: _controller.semesterNameList[index]);
              },
            );
          })
        ],
      ),
    );
  }
}
