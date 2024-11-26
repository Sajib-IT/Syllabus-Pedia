import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syllabus_pedia/view/ai_generated_text/ai_generated_text_controller.dart';
import 'package:syllabus_pedia/widgets/ui_helper/ui_helper.dart';

class AiGeneratedTextView extends StatelessWidget {
  final AiGeneratedTextController _controller =
      Get.put(AiGeneratedTextController());
  AiGeneratedTextView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: UIHelper()
            .drawAppbarTitle(title: "Explore with Artificial Intelligence"),
        centerTitle: false,
      ),
      body: Center(
        child: Obx(
          () => _controller.aiResponseText.value.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Colors.lightBlueAccent,
                      ),
                    ),
                    child: Obx(() => SingleChildScrollView(
                          child: Text(
                            _controller.aiResponseText.value,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 16),
                          ),
                        )),
                  ),
                )
              : const SizedBox(),
        ),
      ),
    );
  }
}
