import 'package:get/get.dart';
import 'package:syllabus_pedia/utils/app_string.dart';

class CourseNameController extends GetxController {
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
}
