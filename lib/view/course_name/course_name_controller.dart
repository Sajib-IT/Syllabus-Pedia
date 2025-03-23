import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:syllabus_pedia/config/firebase_manager.dart';
import 'package:syllabus_pedia/utils/app_string.dart';
import 'package:syllabus_pedia/view/model/course_model.dart';

class CourseNameController extends GetxController {
  final courseNameController = TextEditingController();
  late CourseModel courseModel;
  List<List<String>> allCourseNameList = [];
  String semesterName = "";
  @override
  void onInit() {
    if (Get.arguments != null) {
      semesterName = Get.arguments;
      print(semesterName);
      initializeCourseList();
    }
    super.onInit();
  }

  void initializeCourseList() {
    allCourseNameList = AppString.allCourseNameList(semesterName);
  }

  void addCourse() async{
    courseModel = CourseModel(
        semesterName: semesterName, courseName: courseNameController.text);
    EasyLoading.show(status: "Loading...");
   await FirebaseManager()
        .addCourse(courseModel: courseModel);
    EasyLoading.dismiss();
  }
}
