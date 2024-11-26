import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syllabus_pedia/view/ai_generated_text/ai_generated_text_view.dart';
import 'package:syllabus_pedia/view/course_content_details/course_content_details_controller.dart';
import 'package:syllabus_pedia/view/course_content_details/widget/course_content_details_widget.dart';
import 'package:syllabus_pedia/widgets/ui_helper/ui_helper.dart';

class CourseContentDetailsView extends StatelessWidget {
  final CourseContentDetailsController _controller =
      Get.put(CourseContentDetailsController());
  CourseContentDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: UIHelper().drawAppbarTitle(title: "Course Content Details")),
      floatingActionButton: Obx(
        () => _controller.selectedText.value.isNotEmpty &&
                _controller.selectedText.value.length > 6
            ? Container(
                width: 50,
                height: 50,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: const Icon(Icons.arrow_forward_ios_outlined),
                  color: Colors.white,
                  onPressed: () {
                   Get.to(()=> AiGeneratedTextView(),arguments: _controller.selectedText.value);
                  },
                ),
              )
            : SizedBox(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: List.generate(
              _controller.allCourseContentDetailsList.length, (index) {
            return CourseContentDetailsWidget(
                courseContentDetails:
                    _controller.allCourseContentDetailsList[index]);
          }),
        ),
      ),
    );
  }
}
