import 'package:get/get.dart';
import 'package:syllabus_pedia/utils/app_string.dart';

class CourseContentDetailsController extends GetxController {
  List<Map<String, String>> allCourseContentDetailsList = [];
  String courseName = "";
  @override
  void onInit() {
    if (Get.arguments != null) {
      courseName = Get.arguments;
      print(courseName);
      initializeCourseContentDetailsList();
    }
    super.onInit();
  }

  void initializeCourseContentDetailsList() {
    allCourseContentDetailsList =
        AppString.allCourseContentDetailsList(courseName);
  }
}
