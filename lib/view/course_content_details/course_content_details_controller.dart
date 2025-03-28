// import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';
import 'package:get/get.dart';
import 'package:syllabus_pedia/config/firebase_manager.dart';
import 'package:syllabus_pedia/utils/app_string.dart';
import 'package:syllabus_pedia/view/ai_generated_text/ai_generated_text_view.dart';
import 'package:syllabus_pedia/view/model/content_model.dart';
import 'package:syllabus_pedia/widgets/dialog/alert_custom_dialog.dart';
import 'package:syllabus_pedia/widgets/dialog/customiseable_base_dialog.dart';

class CourseContentDetailsController extends GetxController {
  List<Map<String, String>> allCourseContentDetailsList = [];
  final titleController = TextEditingController();
  final subtitleController = TextEditingController();
  final searchController = TextEditingController();
  late ContentModel contentModel;
  String courseName = "";
  String semesterName = "";
  String courseId = "";
  RxString selectedText = RxString("");
  RxList modifiedText = RxList([]);
  final MultiSelectController _selectController = MultiSelectController();
  @override
  void onInit() {
    if (Get.arguments != null) {
      courseName = Get.arguments[0];
      semesterName = Get.arguments[1];
      courseId = Get.arguments[2];
      if (kDebugMode) {
        print(courseName);
      }
      initializeCourseContentDetailsList();
    }
    super.onInit();
  }

  void addCourseWithContents() async {
    String contentId = DateTime.now().millisecondsSinceEpoch.toString();
    contentModel = ContentModel(
        contentId: contentId,
        title: titleController.text,
        subtitle: subtitleController.text,
        courseName: courseName,
        semesterName: semesterName, courseId: courseId);
    FirebaseManager().addCourseWithContents(contentModel: contentModel);
  }

  void showCustomDialog(List<String> content) {
    CustomiseAbleBaseDialog().showPopup(
      widget: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              "You have selected Multiple topics. that's give you short description.If you want, you can change the number of topic by selecting below topic",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 16),
            MultiSelectContainer(
                controller: _selectController,
                items: List.generate(
                    content.length,
                    (index) => MultiSelectCard(
                          child: Flexible(
                              child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 8),
                            child: Text(content[index]),
                          )),
                          value: content[index],
                          label: content[index],
                        )),
                onChange: (allSelectedItems, selectedItem) {
                  print(selectedItem);
                  print(allSelectedItems.toString());
                  modifiedText.value = allSelectedItems;
                },
                itemsDecoration: MultiSelectDecorations(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Colors.green.withOpacity(0.1),
                        Colors.yellow.withOpacity(0.1),
                      ]),
                      border: Border.all(color: Colors.green[200]!),
                      borderRadius: BorderRadius.circular(20)),
                  selectedDecoration: BoxDecoration(
                      gradient: const LinearGradient(
                          colors: [Colors.green, Colors.lightGreen]),
                      border: Border.all(color: Colors.green[700]!),
                      borderRadius: BorderRadius.circular(5)),
                  disabledDecoration: BoxDecoration(
                      color: Colors.grey,
                      border: Border.all(color: Colors.grey[500]!),
                      borderRadius: BorderRadius.circular(10)),
                ),
                prefix: MultiSelectPrefix(
                    selectedPrefix: const Padding(
                  padding: EdgeInsets.only(right: 0),
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 14,
                  ),
                ))),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FilledButton(
                    style: ButtonStyle(
                        padding: WidgetStateProperty.all(
                            const EdgeInsets.symmetric(horizontal: 8))),
                    onPressed: () {
                      _selectController.selectAll();
                    },
                    child: const Text("Select All")),
                const Spacer(),
                FilledButton(
                    style: ButtonStyle(
                        padding: WidgetStateProperty.all(
                            const EdgeInsets.symmetric(horizontal: 8))),
                    onPressed: () {
                      _selectController.deselectAll();
                    },
                    child: const Text("Unselect All")),
                const Spacer(),
                FilledButton(
                    onPressed: () {
                      if (modifiedText.isNotEmpty) {
                        Get.back();
                        Get.to(() => AiGeneratedTextView(),
                            arguments: modifiedText.toString());
                      } else {
                        AlertCustomDialogs()
                            .showAlert(msg: "Please Select At least One Topic");
                      }
                    },
                    child: const Text("Go"))
              ],
            )
          ],
        ),
      ),
    );
  }

  void initializeCourseContentDetailsList() {
    allCourseContentDetailsList =
        AppString.allCourseContentDetailsList(courseName);
  }

  bool checkValidation() {
    if (searchController.text.isEmpty && searchController.text.length <= 3) {
      AlertCustomDialogs()
          .showAlert(msg: "Please write or select meaningful words");
      return false;
    }
    List<String> content = selectedText.toString().split(',');
    if (content.length >= 2) {
      modifiedText.clear();
      showCustomDialog(content);
      return false;
    }
    return true;
  }
}
