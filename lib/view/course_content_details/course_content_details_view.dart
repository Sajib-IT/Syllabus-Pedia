import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syllabus_pedia/utils/user_or_admin.dart';
import 'package:syllabus_pedia/view/ai_generated_text/ai_generated_text_view.dart';
import 'package:syllabus_pedia/view/course_content_details/course_content_details_controller.dart';
import 'package:syllabus_pedia/view/course_content_details/widget/course_content_details_widget.dart';
import 'package:syllabus_pedia/view/course_content_details/widget/element_details_widget.dart';
import 'package:syllabus_pedia/view/model/content_model.dart';
import 'package:syllabus_pedia/widgets/dialog/syllabus_dialog.dart';
import 'package:syllabus_pedia/widgets/ui_helper/ui_helper.dart';

class CourseContentDetailsView extends StatelessWidget {
  final String appTittle;
  final CourseContentDetailsController _controller =
      Get.put(CourseContentDetailsController());
  // late TextEditingController controller;
  CourseContentDetailsView({super.key, required this.appTittle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: UIHelper().drawAppbarTitle(title: appTittle)),
      floatingActionButton: UserOrAdmin().isAdmin
          ? FloatingActionButton(
              onPressed: () {
                SyllabusDialog().showAddCourseContentsDialog(
                    titleController: _controller.titleController,
                    subtitleController: _controller.subtitleController,
                    onTab: _controller.addCourseWithContents);
              },
              backgroundColor: Colors.blue,
              tooltip: "Add Course Contents",
              child: Icon(Icons.add),
            )
          : null,
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection(_controller.semesterName)
              .doc(_controller.courseId)
              .collection("courseContents")
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                  child: CircularProgressIndicator(
                color: Colors.blue,
              ));
            }

            if (!snapshot.hasData) {
              return const Center(child: Text("No Course details found"));
            }
            List<String> subtitles = snapshot.data!.docs
                .map((doc) => doc['subtitle'].toString())
                .toList();
            print(subtitles);

            return Column(
              children: [
                Autocomplete(
                  optionsBuilder: (TextEditingValue textEditingValue) {
                    if (textEditingValue.text.isEmpty) {
                      return const Iterable<String>.empty();
                    } else {
                      print("valluuees ${subtitles.toString()}");
                      print(
                          "valluuees ${subtitles.toString().split(',').toList()}");
                      String newSubtitle = subtitles
                          .toString()
                          .substring(1, subtitles.toString().length - 1);
                      List<String> content = newSubtitle.split(',');
                      return content.where((word) => word
                          .toLowerCase()
                          .contains(textEditingValue.text.toLowerCase()));
                    }
                  },
                  onSelected: (selectedString) {
                    print(selectedString);
                  },
                  fieldViewBuilder:
                      (context, controller, focusNode, onEditingComplete) {
                    controller.text = _controller.searchController.text;
                    _controller.searchController.text = controller.text;
                    _controller.searchController.addListener(() {
                      if (_controller.searchController.text !=
                          controller.text) {
                        controller.value = _controller.searchController.value;
                      }
                    });
                    controller.addListener(() {
                      if (_controller.searchController.text !=
                          controller.text) {
                        _controller.searchController.value = controller.value;
                      }
                    });
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 1.0),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius:
                              BorderRadius.circular(30.0), // Rounded edges
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 4.0,
                              offset: Offset(2, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            // Search Icon
                            // const Icon(Icons.search, color: Colors.grey),
                            const SizedBox(width: 8.0),
                            // Search TextField
                            Expanded(
                              child: TextField(
                                controller: controller,
                                focusNode: focusNode,
                                // onEditingComplete: onEditingComplete,
                                onEditingComplete: () {
                                  if (_controller.checkValidation()) {
                                    Get.to(() => AiGeneratedTextView(),
                                        arguments: controller.text);
                                  }
                                },
                                decoration: const InputDecoration(
                                  hintText: "Selected Text Search",
                                  border: InputBorder.none,
                                ),
                                onChanged: (value) {},
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.close, color: Colors.grey),
                              onPressed: () {
                                _controller.searchController.clear();
                                controller.clear();
                              },
                            ),
                            // Search Button
                            Container(
                              height: 40.0,
                              width: 40.0,
                              decoration: const BoxDecoration(
                                color: Colors.blue,
                                shape: BoxShape.circle,
                              ),
                              child: IconButton(
                                icon: const Icon(Icons.search,
                                    color: Colors.white),
                                onPressed: () {
                                  if (_controller.checkValidation()) {
                                    Get.to(() => AiGeneratedTextView(),
                                        arguments: controller.text);
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: snapshot.data!.docs.map((item) {
                        ContentModel contentModel =
                            ContentModel.fromJson(item.data());
                        return ElementDetailsWidget(contentModel: contentModel);
                      }).toList(),
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }
}
