import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:syllabus_pedia/config/api-key.dart';

class AiGeneratedTextController extends GetxController {
  String selectedText = '';
  RxString aiResponseText = RxString('');
  String apiKey = api_key;
  @override
  void onInit() {
    if (Get.arguments != null) {
      selectedText = Get.arguments;
      print(selectedText);
    }
    aiGeneratedText();
    super.onInit();
  }

  void aiGeneratedText() async {
    EasyLoading.show(status: "Loading...");
    final model = GenerativeModel(
      model: 'gemini-1.5-flash',
      apiKey: apiKey,
    );
    final prompt = selectedText;
    final response = await model.generateContent([Content.text(prompt)]);
    if (response.text != null) {
      aiResponseText.value = response.text!;
    }
    EasyLoading.dismiss();
    print(response.text);
  }
}
