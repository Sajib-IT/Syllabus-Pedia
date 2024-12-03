import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syllabus_pedia/view/auth/login/login_view_controller.dart';
import 'package:syllabus_pedia/view/auth/signup/sign_up_view.dart';
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
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
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
                      title: "Password",
                      widget: Obx(() => MyTextField(
                            textEditingController:
                                _controller.passwordController,
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
                       _controller.signIn();
                      } else {
                        AlertCustomDialogs()
                            .showAlert(msg: "Please Select All Fields");
                      }
                    },
                    fontSize: 22,
                  ),
                  const SizedBox(height: 16),
                  RichText(
                      text: TextSpan(
                    style: const TextStyle(color: Colors.black, fontSize: 20),
                    text: "Don't have any account ? ",
                    children: [
                      TextSpan(
                        style: const TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.blueAccent),
                        text: "Sign Up",
                        recognizer: TapGestureRecognizer()..onTap = (){
                          Get.to(()=>SignUpView());
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
