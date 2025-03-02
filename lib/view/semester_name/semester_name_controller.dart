import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:syllabus_pedia/utils/user_or_admin.dart';
import 'package:syllabus_pedia/view/model/user_model.dart';

class SemesterNameController extends GetxController {
  List<String> semesterNameList = [
    "First Year First Semester",
    "First Year Second Semester",
    "Second Year First Semester",
    "Second Year Second Semester",
    "Third Year First Semester",
    "Third Year Second Semester",
    "Fourth Year First Semester",
    "Fourth Year Second Semester",
  ];
  Rxn<UserModel> user = Rxn();
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  void onInit() {
    getData();
    UserOrAdmin().init();
    super.onInit();
  }

  Future<void> getData() async {
    try {
      final DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('user')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();

      if (snapshot.exists) {
        user.value =
            UserModel.fromJson(snapshot.data() as Map<String, dynamic>);
        print('User Data: ${user.value?.name}');
      } else {
        print('Document does not exist');
      }
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }
}
