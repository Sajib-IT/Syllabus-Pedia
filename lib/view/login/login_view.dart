import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syllabus_pedia/view/login/login_view_controller.dart';
import 'package:syllabus_pedia/view/semester_name/semester_name_view.dart';
import 'package:syllabus_pedia/widgets/button/custom_elevated_button.dart';
import 'package:syllabus_pedia/widgets/dialog/alert_custom_dialog.dart';
import 'package:syllabus_pedia/widgets/input/my_textfield.dart';
import 'package:syllabus_pedia/widgets/ui_helper/ui_helper.dart';

class LoginView extends StatelessWidget {
  final _controller = Get.put(LoginViewController());
  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0,vertical: 24.0),
              child: Column(
                children: [
                  Image.asset("assets/logo/mbstu.png", scale: 1.80),
                  UIHelper().columTitleWithWidget(
                      title: "Email",
                      widget: MyTextField(
                        textEditingController: _controller.email,
                        suffixIcon: const Icon(
                          Icons.email_outlined,
                        ),
                        hintText: "input Email",
                      )),
                  UIHelper().columTitleWithWidget(
                      title: "Password",
                      widget: Obx(() => MyTextField(
                            textEditingController: _controller.password,
                            textInputAction: TextInputAction.done,
                            hintText: "input password",
                            isPassword: true,
                            isobscureText: _controller.isPasswordHidden.value,
                            isPasswordObscure: (value) {
                              _controller.isPasswordHidden.value = value;
                            },
                          ))),
                  const SizedBox(height: 32),
                  CustomElevatedButton(
                    text: "Login",
                    onPressed: () {
                      if (_controller.checkForm()) {
                        Get.to(() => SemesterNameView());
                      } else {
                        AlertCustomDialogs()
                            .showAlert(msg: "Please Select All Fields");
                      }
                    },
                    fontSize: 22,
                  ),
                  const SizedBox(
                    height: 8,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
