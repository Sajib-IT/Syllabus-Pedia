import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syllabus_pedia/view/feedback/feedback_controller.dart';
import 'package:syllabus_pedia/widgets/button/custom_elevated_button.dart';
import 'package:syllabus_pedia/widgets/dialog/alert_custom_dialog.dart';
import 'package:syllabus_pedia/widgets/input/my_textfield.dart';
import 'package:syllabus_pedia/widgets/ui_helper/ui_helper.dart';

class UserFeedback extends StatelessWidget {
  final FeedbackController _controller = Get.put(FeedbackController());
  UserFeedback({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: UIHelper().drawAppbarTitle(title: "Feedback"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              "If any enquiry or any suggestion please submit feedback from below:",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MyTextField(
                textEditingController: _controller.feedbackController,
                maxLine: 5,
                hintText: "Enter your valuable feedback",
              ),
            ),
            const SizedBox(height: 40),
            CustomElevatedButton(text: "Submit", onPressed: () {
              if(_controller.feedbackController.text.isNotEmpty){
                _controller.saveFeedback();
                // _controller.feedbackController.clear();
              }else{
                AlertCustomDialogs().showAlert(msg: "Please write feedback in feedback field");
              }
            })
          ],
        ),
      ),
    );
  }
}
