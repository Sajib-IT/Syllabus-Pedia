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
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                RichText(
                    text: TextSpan(
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w400),
                      text: "The description is given below about : ",
                      children: [
                        TextSpan(
                          style: const TextStyle(fontWeight: FontWeight.w700),
                          text: _controller.selectedText,
                        ),
                      ],
                    )),
                const SizedBox(height: 8),
                Expanded(
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
                      child: RichText(
                        text: TextSpan(
                          style: const TextStyle(
                              color: Colors.black, fontSize: 16),
                          children: _buildFormattedText(_controller.aiResponseText.value),
                        ),
                      ),
                    )),
                  ),
                ),
                const SizedBox(height: 8),
              ],
            ),
          )
              : const SizedBox(),
        ),
      ),
    );
  }

  // Function to handle text formatting, remove markdown-like symbols, and add new lines
  List<TextSpan> _buildFormattedText(String response) {
    List<TextSpan> formattedText = [];

    // Clean the response to remove markdown-like symbols (*, **, etc.)
    response = response.replaceAll(RegExp(r"\*{1,2}"), "");

    // Split the response into lines and process each line
    List<String> lines = response.split('\n');
    for (String line in lines) {
      // Check if the line contains a heading or a subheading with a colon at the end
      final colonIndex = line.indexOf(':');
      if (colonIndex != -1) {
        // Bold text up to the colon
        formattedText.add(TextSpan(
          text: line.substring(0, colonIndex + 1), // up to the colon
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ));
        // Regular text after the colon
        formattedText.add(TextSpan(
          text: '${line.substring(colonIndex + 1)}\n', // after the colon with a newline
          style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
        ));
      } else {
        // If there's no colon, treat it as regular text with a new line
        formattedText.add(TextSpan(
          text: '${line.trim()}\n', // Add new line after regular text
          style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
        ));
      }
    }
    return formattedText;
  }
}





// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:syllabus_pedia/utils/util.dart';
// import 'package:syllabus_pedia/view/ai_generated_text/ai_generated_text_controller.dart';
// import 'package:syllabus_pedia/widgets/ui_helper/ui_helper.dart';
//
// class AiGeneratedTextView extends StatelessWidget {
//   final AiGeneratedTextController _controller =
//       Get.put(AiGeneratedTextController());
//   AiGeneratedTextView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: UIHelper()
//             .drawAppbarTitle(title: "Explore with Artificial Intelligence"),
//         centerTitle: false,
//       ),
//       body: Center(
//         child: Obx(
//           () => _controller.aiResponseText.value.isNotEmpty
//               ? Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                   child: Column(
//                     children: [
//                       RichText(
//                           text: TextSpan(
//                         style: const TextStyle(
//                             color: Colors.black,
//                             fontSize: 15,
//                             fontWeight: FontWeight.w400),
//                         text: "The description is given below about : ",
//                         children: [
//                           TextSpan(
//                             style: const TextStyle(fontWeight: FontWeight.w700),
//                             text: _controller.selectedText,
//                           ),
//                         ],
//                       )),
//                       const SizedBox(height: 8),
//                       Expanded(
//                         child: Container(
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 16, vertical: 16),
//                           decoration: BoxDecoration(
//                             color: Colors.grey.shade200,
//                             borderRadius: BorderRadius.circular(8),
//                             border: Border.all(
//                               color: Colors.lightBlueAccent,
//                             ),
//                           ),
//                           child: Obx(() => SingleChildScrollView(
//                                 child: Text(
//                                   Util.cleanResponse(_controller.aiResponseText.value),
//                                   style: const TextStyle(
//                                       color: Colors.black, fontSize: 16),
//                                 ),
//                               )),
//                         ),
//                       ),
//                       const SizedBox(height: 8),
//                     ],
//                   ),
//                 )
//               : const SizedBox(),
//         ),
//       ),
//     );
//   }
// }
