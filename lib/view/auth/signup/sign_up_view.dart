import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syllabus_pedia/view/auth/login/login_view.dart';
import 'package:syllabus_pedia/view/auth/signup/sign_up_controller.dart';
import 'package:syllabus_pedia/widgets/button/custom_elevated_button.dart';
import 'package:syllabus_pedia/widgets/dialog/alert_custom_dialog.dart';
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
              padding: const EdgeInsets.symmetric(horizontal: 24.0,vertical: 24.0),
              child: Column(
                children: [
                  Image.asset("assets/logo/mbstu.png", scale: 1.80),
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
                      title: "ID",
                      widget: MyTextField(
                        textEditingController: _controller.idController,
                        suffixIcon: const Icon(
                          Icons.edit_square,
                        ),
                        hintText: "input ID",
                      )),
                  UIHelper().columTitleWithWidget(
                      title: "Password",
                      widget: Obx(() => MyTextField(
                        textEditingController: _controller.passwordController,
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
                        textEditingController: _controller.confirmPasswordController,
                        // textInputAction: TextInputAction.done,
                        hintText: "input Confirm password",
                        isPassword: true,
                        isobscureText: _controller.isPasswordHidden.value,
                        isPasswordObscure: (value) {
                          _controller.isPasswordHidden.value = value;
                        },
                      ))),
                  const SizedBox(height: 32),
                  CustomElevatedButton(
                    text: "Sign Up",
                    onPressed: () {
                      if (_controller.checkForm()) {
                       _controller.signUp();
                      } else {
                        AlertCustomDialogs()
                            .showAlert(msg: "Please Select All Fields");
                      }
                    },
                    fontSize: 22,
                  ),
                  const SizedBox(
                      height: 16
                  ),
                  RichText(
                      text: TextSpan(
                        style: const TextStyle(color: Colors.black, fontSize: 20),
                        text: "Already have account ? ",
                        children: [
                          TextSpan(
                              style: const TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Colors.blueAccent),
                              text: "Log In",
                              recognizer: TapGestureRecognizer()..onTap = (){
                                Get.to(()=>LoginView());
                              }
                          ),
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
