import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syllabus_pedia/view/auth/login/login_view.dart';
import 'package:syllabus_pedia/view/auth/signup/sign_up_controller.dart';
import 'package:syllabus_pedia/widgets/button/custom_elevated_button.dart';
import 'package:syllabus_pedia/widgets/drop_down/my_dropdown_button.dart';
import 'package:syllabus_pedia/widgets/input/my_textfield.dart';
import 'package:syllabus_pedia/widgets/ui_helper/ui_helper.dart';

class SignUpView extends StatelessWidget {
  final _controller = Get.put(SignUpController());
  SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(),
          body: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
              child: Column(
                children: [
                  Image.asset(
                    "assets/logo/ict_logo.png",
                    height: 140,
                    width: 200,
                  ),
                  UIHelper().columTitleWithWidget(
                      title: "Email",
                      widget: MyTextField(
                        textEditingController: _controller.emailController,
                        suffixIcon: const Icon(
                          Icons.email_outlined,
                        ),
                        hintText: "input Email",
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
                      title: "Student Name",
                      widget: MyTextField(
                        textEditingController: _controller.nameController,
                        suffixIcon: const Icon(
                          Icons.person,
                        ),
                        hintText: "input Name",
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
                  UIHelper().columTitleWithWidget(
                      title: "Password",
                      widget: Obx(() => MyTextField(
                            textEditingController:
                                _controller.passwordController,
                            // textInputAction: TextInputAction.done,
                            hintText: "input password",
                            isPassword: true,
                            isobscureText: _controller.isPasswordHidden.value,
                            isPasswordObscure: (value) {
                              _controller.isPasswordHidden.value = value;
                            },
                          ))),
                  UIHelper().columTitleWithWidget(
                      title: "Confirm Password",
                      widget: Obx(() => MyTextField(
                            textEditingController:
                                _controller.confirmPasswordController,
                            // textInputAction: TextInputAction.done,
                            hintText: "input Confirm password",
                            isPassword: true,
                            isobscureText: _controller.isPasswordHidden.value,
                            isPasswordObscure: (value) {
                              _controller.isPasswordHidden.value = value;
                            },
                          ))),
                  const SizedBox(height: 16),
                  CustomElevatedButton(
                    text: "Sign Up",
                    onPressed: () {
                      if (_controller.checkForm()) {
                        _controller.signUp();
                      }
                    },
                    fontSize: 22,
                  ),
                  const SizedBox(height: 16),
                  RichText(
                      text: TextSpan(
                    style: const TextStyle(color: Colors.black, fontSize: 18),
                    text: "Already have account ? ",
                    children: [
                      TextSpan(
                          style: const TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.blueAccent),
                          text: "Log In",
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.to(() => LoginView());
                            }),
                    ],
                  ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
