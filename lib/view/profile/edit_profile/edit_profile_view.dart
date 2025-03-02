import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syllabus_pedia/view/profile/edit_profile/edit_profile_controller.dart';
import 'package:syllabus_pedia/widgets/button/custom_elevated_button.dart';
import 'package:syllabus_pedia/widgets/drop_down/my_dropdown_button.dart';
import 'package:syllabus_pedia/widgets/input/my_textfield.dart';
import 'package:syllabus_pedia/widgets/ui_helper/ui_helper.dart';

class EditProfileView extends StatelessWidget {
  final _controller = Get.put(EditProfileController());
  EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: UIHelper().drawAppbarTitle(title: "Edit Profile")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
        child: Obx(() => !_controller.isLoading.value
            ? Column(
                children: [
                  UIHelper().columTitleWithWidget(
                      title: "Student Name",
                      widget: MyTextField(
                        textEditingController: _controller.nameController,
                        suffixIcon: const Icon(
                          Icons.person,
                        ),
                        hintText: "input Name",
                      )),
                  UIHelper().columTitleWithWidget(
                      title: "Student ID",
                      widget: MyTextField(
                        textEditingController: _controller.studentIdController,
                        suffixIcon: const Icon(
                          Icons.edit_square,
                        ),
                        hintText: "input ID",
                      )),
                  UIHelper().columTitleWithWidget(
                      title: "Session",
                      widget: MyTextField(
                        textEditingController: _controller.sessionController,
                        suffixIcon: const Icon(
                          Icons.timelapse,
                        ),
                        hintText: "input Session",
                      )),
                  UIHelper().columTitleWithWidget(
                      title: "Year",
                      widget: MyDropdownButton(
                        value: _controller.selectedYear.value,
                        items: _controller.yearList,
                        onChanged: (value) {
                          _controller.selectedYear.value = value;
                        },
                      )),
                  UIHelper().columTitleWithWidget(
                      title: "Semester",
                      widget: MyDropdownButton(
                        value: _controller.selectedSemester.value,
                        items: _controller.semesterList,
                        onChanged: (value) {
                          _controller.selectedSemester.value = value;
                        },
                      )),
                  const SizedBox(height: 24),
                  CustomElevatedButton(
                    text: "Update",
                    onPressed: () async {
                      _controller.updateUserData();
                    },
                    fontSize: 22,
                  ),
                ],
              )
            : const Center(
                child: CircularProgressIndicator(color: Colors.red),
              )),
      ),
    );
  }
}
