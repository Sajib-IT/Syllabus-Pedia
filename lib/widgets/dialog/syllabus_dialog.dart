import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syllabus_pedia/view/model/content_model.dart';
import 'package:syllabus_pedia/widgets/button/custom_elevated_button.dart';
import 'package:syllabus_pedia/widgets/input/my_textfield.dart';
import 'package:syllabus_pedia/widgets/ui_helper/ui_helper.dart';

class SyllabusDialog {
  void showAddCourseDialog(
      {required TextEditingController courseController,
      required VoidCallback onTab}) {
    Get.defaultDialog(
      title: "Add Course",
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: UIHelper().columTitleWithWidget(
            title: "Course Name",
            widget: MyTextField(
              textEditingController: courseController,
              hintText: "Enter Course Name",
            )),
      ),
      confirm: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: CustomElevatedButton(
          text: "Add",
          onPressed: () {
            onTab();
            Get.back();
            courseController.clear();
          },
        ),
      ),
      cancel: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: CustomElevatedButton(
          text: "Cancel",
          backgroundColor: Colors.red.shade50,
          textColor: Colors.red,
          onPressed: () {
            Get.back();
          },
        ),
      ),
    );
  }

  void showAddCourseContentsDialog(
      {required TextEditingController titleController,
      required TextEditingController subtitleController,
      required VoidCallback onTab,
      bool isEdit = false,
      ContentModel? contentModel}) {
    if (isEdit) {
      titleController.text = contentModel!.title;
      subtitleController.text = contentModel.subtitle;
    }
    Get.defaultDialog(
      title: "Add Course Contents",
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            UIHelper().columTitleWithWidget(
                title: "Course Content Title",
                widget: MyTextField(
                  textEditingController: titleController,
                  hintText: "Enter Course Content Title/Heading",
                )),
            UIHelper().columTitleWithWidget(
                title: "Course Content Subtitle",
                widget: MyTextField(
                  maxLine: 4,
                  textEditingController: subtitleController,
                  hintText: "Enter Course Content details",
                )),
          ],
        ),
      ),
      confirm: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: CustomElevatedButton(
          text: isEdit ? "Update" : "Add",
          onPressed: () {
            onTab();
            Get.back();
            titleController.clear();
            subtitleController.clear();
          },
        ),
      ),
      cancel: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: CustomElevatedButton(
          text: "Cancel",
          backgroundColor: Colors.red.shade50,
          textColor: Colors.red,
          onPressed: () {
            Get.back();
          },
        ),
      ),
    );
  }
}
