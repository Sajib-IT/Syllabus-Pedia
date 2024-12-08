import 'package:get/get.dart';
import 'package:syllabus_pedia/view/auth/auth_page/auth_view.dart';

class WelcomeViewController extends GetxController {
  @override
  void onInit() {
    appInit();
    super.onInit();
  }

  void appInit() async {
    await Future.delayed(const Duration(seconds: 2));
    // Get.to(() => LoginView());
    Get.off(() => AuthView());
  }
}
