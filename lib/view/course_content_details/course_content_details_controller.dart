import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:syllabus_pedia/utils/app_string.dart';

class CourseContentDetailsController extends GetxController {
  List<Map<String, String>> allCourseContentDetailsList = [];
  String courseName = "";
  RxString selectedText = RxString("");
  @override
  void onInit() {
    if (Get.arguments != null) {
      courseName = Get.arguments;
      if (kDebugMode) {
        print(courseName);
      }
      initializeCourseContentDetailsList();
    }
    super.onInit();
  }

  void initializeCourseContentDetailsList() {
    allCourseContentDetailsList =
        AppString.allCourseContentDetailsList(courseName);
  }

  bool checkValidation(){
    if(selectedText.value.isNotEmpty &&
        selectedText.value.length > 10){
      return true;
    }
    return false;
  }
}
