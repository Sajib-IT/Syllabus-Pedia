import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syllabus_pedia/view/auth/auth_page/auth_controller.dart';
import 'package:syllabus_pedia/view/auth/auth_page/auth_view.dart';
import 'package:syllabus_pedia/widgets/button/custom_elevated_button.dart';
import 'package:syllabus_pedia/widgets/ui_helper/ui_helper.dart';

class VerifyEmailView extends StatelessWidget {
  final _controller = Get.put(AuthController());
  VerifyEmailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: UIHelper().drawAppbarTitle(title: "Verify Email"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "A verification email has been sent to you email.. please check your email...",
              //\nAfter complete verification ,click Continue button for access next procedure
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 32),
            // CustomElevatedButton(
            //   text: "Continue",
            //   onPressed: () {
            //     // FirebaseAuth.instance.signOut();
            //     _controller.reload();
            //   },
            //   fontSize: 22,
            // ),
            // const SizedBox(height: 16),
            CustomElevatedButton(
              text: "Cancel",
              onPressed: () {
                _controller.timer?.cancel();
                FirebaseAuth.instance.signOut();
                Get.off(() => AuthView());
                // _controller.reload();
              },
              fontSize: 22,
            )
          ],
        ),
      ),
    );
  }
}
