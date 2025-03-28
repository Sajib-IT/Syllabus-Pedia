import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syllabus_pedia/config/firebase_manager.dart';
import 'package:syllabus_pedia/utils/user_or_admin.dart';
import 'package:syllabus_pedia/view/course_content_details/course_content_details_controller.dart';
import 'package:syllabus_pedia/view/model/content_model.dart';
import 'package:syllabus_pedia/widgets/dialog/confirmation_dialog.dart';
import 'package:syllabus_pedia/widgets/dialog/syllabus_dialog.dart';

class ElementDetailsWidget extends StatelessWidget {
  final CourseContentDetailsController _controller = Get.find();
  final ContentModel contentModel;

  ElementDetailsWidget({super.key, required this.contentModel});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SelectableText(
              "${contentModel.title} :",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
              onSelectionChanged: (textSelection, cause) {
                final select = contentModel.title
                    .substring(textSelection.start, textSelection.end);
                _controller.selectedText.value = select;
                _controller.searchController.text =
                    _controller.selectedText.value;
              },
            ),
            const SizedBox(height: 8),
            SelectableText(
              contentModel.subtitle,
              strutStyle: const StrutStyle(fontSize: 20),
              textAlign: TextAlign.justify,
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
              onSelectionChanged: (textSelection, cause) {
                final select = contentModel.subtitle
                    .substring(textSelection.start, textSelection.end);
                log(select);
                _controller.selectedText.value = select;
                _controller.searchController.text =
                    _controller.selectedText.value;
              },
            ),
            const SizedBox(height: 16),
            // Buttons: Edit, Delete
            if (UserOrAdmin().isAdmin)
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      SyllabusDialog().showAddCourseContentsDialog(
                          isEdit: true,
                          contentModel: contentModel,
                          titleController: _controller.titleController,
                          subtitleController: _controller.subtitleController,
                          onTab: () {
                            FirebaseManager().updateContent(
                                contentModel,
                                _controller.titleController.text,
                                _controller.subtitleController.text);
                          });

                      // Implement Edit logic here
                    },
                    icon: const Icon(Icons.edit, color: Colors.white),
                    label: const Text("Edit"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton.icon(
                    onPressed: () {
                      ConfirmationDialog().showDelete(function: () {
                        FirebaseManager().deleteContent(contentModel);
                      });
                    },
                    icon: const Icon(Icons.delete, color: Colors.white),
                    label: const Text("Delete"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
