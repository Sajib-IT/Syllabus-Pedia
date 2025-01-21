import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syllabus_pedia/view/auth/login/login_view_controller.dart';
import 'package:syllabus_pedia/widgets/input/my_textfield.dart';
import 'package:syllabus_pedia/widgets/ui_helper/ui_helper.dart';

class ForgetPasswordView extends StatelessWidget {
  final LoginViewController _loginViewController = Get.find();
  final forgetPasswordController = TextEditingController();
  ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: UIHelper().drawAppbarTitle(title: "Forget Password"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              UIHelper().columTitleWithWidget(
                  title: "Email",
                  widget: MyTextField(
                    textEditingController: forgetPasswordController,
                    suffixIcon: const Icon(
                      Icons.email_outlined,
                    ),
                    hintText: "Enter Email Address",
                  )),
              Transform.translate(
                offset: const Offset(-10, 0),
                child: OutlinedButton(
                  onPressed: () {
                    _loginViewController.sendForgetPasswordLink(forgetPasswordController.text.trim());
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.blue.shade300,
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                  ),
                  child: const Text(
                    "Submit",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
