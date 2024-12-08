import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syllabus_pedia/view/ai_generated_text/ai_generated_text_view.dart';
import 'package:syllabus_pedia/view/course_content_details/course_content_details_controller.dart';
import 'package:syllabus_pedia/view/course_content_details/widget/course_content_details_widget.dart';
import 'package:syllabus_pedia/widgets/dialog/alert_custom_dialog.dart';
import 'package:syllabus_pedia/widgets/ui_helper/ui_helper.dart';

class CourseContentDetailsView extends StatelessWidget {
  final String appTittle;
  final CourseContentDetailsController _controller =
      Get.put(CourseContentDetailsController());
  late TextEditingController controller;
  CourseContentDetailsView({super.key, required this.appTittle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: UIHelper().drawAppbarTitle(title: "Course Content Details")),
          title: UIHelper().drawAppbarTitle(title: appTittle)),
      // floatingActionButton: Container(
      //   width: 50,
      //   height: 50,
      //   decoration: const BoxDecoration(
      //     color: Colors.blue,
      //     shape: BoxShape.circle,
      //   ),
      //   child: IconButton(
      //     icon: const Icon(Icons.search),
      //     color: Colors.white,
      //     onPressed: () {
      //       if (_controller.checkValidation()) {
      //         Get.to(() => AiGeneratedTextView(),
      //             arguments: _controller.selectedText.value);
      //       } else {
      //         AlertCustomDialogs().showAlert(msg: AppString.selectionAlert);
      //       }
      //     },
      //   ),
      // ),
      body: Column(
        children: [
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 8.0),
          //   child: Container(
          //     padding:
          //         const EdgeInsets.symmetric(horizontal: 8.0, vertical: 1.0),
          //     decoration: BoxDecoration(
          //       color: Colors.grey.shade200,
          //       borderRadius: BorderRadius.circular(30.0), // Rounded edges
          //       boxShadow: const [
          //         BoxShadow(
          //           color: Colors.black26,
          //           blurRadius: 4.0,
          //           offset: Offset(2, 2),
          //         ),
          //       ],
          //     ),
          //     child: Row(
          //       children: [
          //         // Search Icon
          //         // const Icon(Icons.search, color: Colors.grey),
          //         const SizedBox(width: 8.0),
          //         // Search TextField
          //         Expanded(
          //           child: TextField(
          //             controller: _controller.searchController,
          //             decoration: const InputDecoration(
          //               hintText: "Selected Text Search",
          //               border: InputBorder.none,
          //             ),
          //             onChanged: (value) {},
          //           ),
          //         ),
          //         IconButton(
          //           icon: const Icon(Icons.close, color: Colors.grey),
          //           onPressed: () {
          //             _controller.searchController.clear();
          //           },
          //         ),
          //         // Search Button
          //         Container(
          //           height: 40.0,
          //           width: 40.0,
          //           decoration: const BoxDecoration(
          //             color: Colors.blue,
          //             shape: BoxShape.circle,
          //           ),
          //           child: IconButton(
          //             icon: const Icon(Icons.search, color: Colors.white),
          //             onPressed: () {
          //               if (_controller.checkValidation()) {
          //                 Get.to(() => AiGeneratedTextView(),
          //                     arguments: _controller.searchController.text);
          //               } else {
          //                 AlertCustomDialogs().showAlert(
          //                     msg: "Please write or select meaningful words");
          //               }
          //             },
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          Autocomplete(
            optionsBuilder: (TextEditingValue textEditingValue) {
              if (textEditingValue.text.isEmpty) {
                return const Iterable<String>.empty();
              } else {
                // print(
                //     "valluuees ${_controller.allCourseContentDetailsList[0].values.toString().split(',').toList()}");
                // print(
                //     "valluuees ${_controller.allCourseContentDetailsList[0].values.toString().split(',')[2]}");
                List<String> content = _controller
                    .allCourseContentDetailsList[0].values
                    .toString()
                    .split(',');
                return content.where((word) => word
                    .toLowerCase()
                    .contains(textEditingValue.text.toLowerCase()));
              }
            },
            // optionsViewBuilder:
            //     (context, Function(String) onSelected, options) {
            //   return SizedBox(
            //     height: 200,
            //     width: 300,
            //     child: Material(
            //       elevation: 4,
            //       child: ListView.separated(
            //         padding: EdgeInsets.zero,
            //         itemBuilder: (context, index) {
            //           final option = options.elementAt(index);
            //
            //           return ListTile(
            //             // title: Text(option.toString()),
            //             title: SubstringHighlight(
            //               text: option.toString(),
            //               term: controller.text,
            //               textStyleHighlight: TextStyle(fontWeight: FontWeight.w700),
            //             ),
            //             // subtitle: Text("This is subtitle"),
            //             onTap: () {
            //               onSelected(option.toString());
            //             },
            //           );
            //         },
            //         separatorBuilder: (context, index) => Divider(),
            //         itemCount: options.length,
            //       ),
            //     ),
            //   );
            // },
            onSelected: (selectedString) {
              print(selectedString);
            },
            fieldViewBuilder:
                (context, controller, focusNode, onEditingComplete) {
              controller.text = _controller.searchController.text;
              _controller.searchController.addListener(() {
                if (_controller.searchController.text != controller.text) {
                  controller.value =
                      _controller.searchController.value;
                }
              });
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 1.0),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(30.0), // Rounded edges
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
                          onEditingComplete: () {},
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
                          icon: const Icon(Icons.search, color: Colors.white),
                          onPressed: () {
                            if (_controller.checkValidation()) {
                              Get.to(() => AiGeneratedTextView(),
                                  arguments: controller.text);
                            } else {
                              AlertCustomDialogs().showAlert(
                                  msg:
                                      "Please write or select meaningful words");
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
              // return TextField(
              //   controller: controller,
              //   focusNode: focusNode,
              //   onEditingComplete: onEditingComplete,
              //   decoration: InputDecoration(
              //     border: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(8),
              //       borderSide: BorderSide(color: Colors.grey[300]!),
              //     ),
              //     focusedBorder: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(8),
              //       borderSide: BorderSide(color: Colors.grey[300]!),
              //     ),
              //     enabledBorder: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(8),
              //       borderSide: BorderSide(color: Colors.grey[300]!),
              //     ),
              //     hintText: "Search Something",
              //     prefixIcon: Icon(Icons.search),
              //   ),
              // );
            },
          ),
          const SizedBox(height: 16),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: List.generate(
                    _controller.allCourseContentDetailsList.length, (index) {
                  return CourseContentDetailsWidget(
                      courseContentDetails:
                          _controller.allCourseContentDetailsList[index]);
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
