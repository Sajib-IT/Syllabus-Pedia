import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syllabus_pedia/config/firebase_manager.dart';
import 'package:syllabus_pedia/utils/user_or_admin.dart';
import 'package:syllabus_pedia/view/course_content_details/course_content_details_view.dart';
import 'package:syllabus_pedia/view/course_name/course_name_controller.dart';
import 'package:syllabus_pedia/view/course_name/widget/course_name_widget.dart';
import 'package:syllabus_pedia/view/model/course_model.dart';
import 'package:syllabus_pedia/widgets/button/semester_button.dart';
import 'package:syllabus_pedia/widgets/dialog/syllabus_dialog.dart';
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
      floatingActionButton: UserOrAdmin().isAdmin
          ? FloatingActionButton(
              onPressed: () {
                SyllabusDialog().showAddCourseDialog(
                    courseController: _controller.courseNameController,
                    onTab: _controller.addCourse);
              },
              backgroundColor: Colors.blue,
              tooltip: "Add Course",
              child: Icon(Icons.add),
            )
          : null,
      body: SingleChildScrollView(
          child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection(_controller.semesterName)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                      child: CircularProgressIndicator(
                    color: Colors.blue,
                  ));
                }

                if (!snapshot.hasData) {
                  return const Center(child: Text("No Course found"));
                }
                return Column(
                    children: snapshot.data!.docs.map((item) {
                  CourseModel courseModel = CourseModel.fromJson(item.data());
                  return SemesterButton(
                    text: courseModel.courseName,
                    isCenter: false,
                    onTab: () {
                      Get.to(
                          () => CourseContentDetailsView(
                              appTittle: courseModel.courseName),
                          arguments: [
                            courseModel.courseName,
                            courseModel.semesterName,
                            courseModel.courseId
                          ]);
                    },
                    courseModel: UserOrAdmin().isAdmin ? courseModel :null,
                    onDelete: () {},
                  );
                }).toList()
                    // List.generate(
                    //     _controller.allCourseNameList.length,
                    //         (index) => CourseNameWidget(
                    //         courseNameList: _controller.allCourseNameList[index])),
                    );
              })),
    );
  }
}
