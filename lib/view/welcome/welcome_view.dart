import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syllabus_pedia/view/welcome/welcome_view_controller.dart';

class WelcomeView extends StatelessWidget {
  final WelcomeViewController _controller = Get.put(WelcomeViewController());
   WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Image.asset(
              'assets/logo/mbstu.png',
              height: 170,
              width: 170,
            ),
          ),
        ),
      ),
    );
  }
}
