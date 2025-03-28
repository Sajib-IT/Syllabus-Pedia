import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syllabus_pedia/config/firebase_manager.dart';
import 'package:syllabus_pedia/view/model/content_model.dart';
import 'package:syllabus_pedia/view/model/course_model.dart';
import 'package:syllabus_pedia/widgets/button/custom_elevated_button.dart';
import 'package:syllabus_pedia/widgets/dialog/confirmation_dialog.dart';
import 'package:syllabus_pedia/widgets/input/my_textfield.dart';

class SemesterButton extends StatelessWidget {
  final String text;
  final CourseModel? courseModel;
  final bool isCenter;
  final FontWeight? fontWeight;
  final VoidCallback? onTab;
  // final Function(CourseModel courseModel)? onEdit;
  final VoidCallback? onDelete;

  const SemesterButton({
    super.key,
    required this.text,
    this.onTab,
    this.courseModel,
    // this.onEdit,
    this.onDelete,
    this.fontWeight,
    this.isCenter = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: InkWell(
        onTap: onTab,
        child: Stack(children: [
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: courseModel != null ? 16.0 : 16,
                vertical: courseModel != null ? 16.0 : 16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blueAccent.shade100),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: isCenter
                  ? MainAxisAlignment.center
                  : MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    text,
                    textAlign: isCenter ? TextAlign.center : TextAlign.start,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: fontWeight ?? FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (courseModel != null)
            Positioned(
              bottom: 10,
              right: 0,
              child: IconButton(
                visualDensity: VisualDensity.compact,
                icon: Icon(Icons.more_vert, size: 28, color: Colors.black),
                onPressed: () {
                  showEditDeletePopup(courseModel!, onDelete!);
                },
              ),
              // child: Row(
              //   mainAxisSize: MainAxisSize.min,
              //   children: [
              //     IconButton(
              //       visualDensity: VisualDensity.compact,
              //       icon: Icon(Icons.edit, color: Colors.blue),
              //       onPressed: onEdit,
              //     ),
              //     IconButton(
              //       visualDensity: VisualDensity.compact,
              //       icon: Icon(Icons.delete, color: Colors.red),
              //       onPressed: onDelete,
              //     ),
              //   ],
              // ),
            )
        ]),
      ),
    );
  }
}

void showEditDeletePopup(CourseModel courseModel, Function() onDelete) {
  Get.bottomSheet(
    Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: Icon(Icons.edit, color: Colors.blue),
            title: Text("Edit"),
            onTap: () {
              Get.back();
              showEditPopup(courseModel); // Close the popup
              // onEdit(); // Call the edit function
            },
          ),
          ListTile(
            leading: Icon(Icons.delete, color: Colors.red),
            title: Text("Delete"),
            onTap: () {
              Get.back();
              ConfirmationDialog().showDelete(function: () {
                FirebaseManager().deleteCourse(courseModel);
              });
              onDelete(); // Call the delete function
            },
          ),
          const SizedBox(height: 10),
        ],
      ),
    ),
  );
}

void showEditPopup(CourseModel courseModel) {
  TextEditingController textController = TextEditingController();
  textController.text = courseModel.courseName;
  Get.dialog(
    AlertDialog(
      title: Text("Update Course"),
      content: MyTextField(
        textEditingController: textController,
        hintText: "Enter updated course name value",
      ),
      actions: [
        CustomElevatedButton(
          text: "Cancel",
          backgroundColor: Colors.white,
          textColor: Colors.red,
          borderColor: Colors.red,
          onPressed: () => Get.back(),
        ),
        SizedBox(height: 8),
        CustomElevatedButton(
          text: "Update",
          onPressed: () {
            if (textController.text.isNotEmpty) {
              FirebaseManager().updateCourse(courseModel, textController.text);
              // Pass new value
              Get.back(); // Close popup
            }
          },
        ),
      ],
    ),
  );
}
