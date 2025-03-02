import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:syllabus_pedia/utils/user_or_admin.dart';
import 'package:syllabus_pedia/view/model/user_model.dart';

class ProfileController extends GetxController {
  String coordinates = "No Location found";
  double latitude = 0.0;
  double longitude = 0.0;
  RxnString address = RxnString();
  Rxn<UserModel> user = Rxn();
  RxnString profileImageUrl = RxnString();
  RxBool isImageLoading = RxBool(false);
  @override
  void onInit() async {
    // checkPermission();
    await getData();
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
        print('User Data: ${user.value!.name}');
      } else {
        print('Document does not exist');
      }
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }

  void changeProfilePicture() async {
    // await CameraGalleryOptionDialog().show(callback: (File? file) async {
    //   if (file != null) {
    //     EasyLoading.show(status: "Loading");
    //     var result = await UploadApiService().uploadImage(file);
    //     if (result != null) {
    //       profileImageUrl.value = result;
    //       log("image url ${profileImageUrl.value!}");
    //     }
    //     updateFirestoreImage();
    //     EasyLoading.dismiss();
    //   }
    // });
  }

  void updateFirestoreImage() async {
    // EasyLoading.show(status: "Loading..");
    // isImageLoading.value = true;
    // final String userId = FirebaseAuth.instance.currentUser!.uid;
    // log("userId $userId");
    // try {
    //   await FirebaseFirestore.instance.collection('user').doc(userId).update({
    //     'profileImageUrl': profileImageUrl.value,
    //   });
    //   // AlertCustomDialogs().showSuccess(msg: "User data updated successfully");
    // } catch (e) {
    //   AlertCustomDialogs().showAlert(msg: e.toString());
    //   log(e.toString());
    // }
    // getData();
    // isImageLoading.value = false;
    // EasyLoading.dismiss();
  }

  checkPermission() async {
    // bool serviceEnabled;
    // LocationPermission permission;
    //
    // serviceEnabled = await Geolocator.isLocationServiceEnabled();
    //
    // print(serviceEnabled);
    //
    // if (!serviceEnabled) {
    //   await Geolocator.openLocationSettings();
    //   return;
    // }
    //
    // permission = await Geolocator.checkPermission();
    //
    // print(permission);
    //
    // if (permission == LocationPermission.denied) {
    //   permission = await Geolocator.requestPermission();
    //
    //   if (permission == LocationPermission.denied) {
    //     AlertCustomDialogs().showAlert(msg: "Request Denied");
    //     return;
    //   }
    // }
    //
    // if (permission == LocationPermission.deniedForever) {
    //   Geolocator.openAppSettings();
    //   return;
    // }
    //
    // getLocation();
  }

  getLocation() async {
  //   EasyLoading.show(status: "Loading");
  //   const LocationSettings locationSettings = LocationSettings(
  //     accuracy: LocationAccuracy.high,
  //     distanceFilter: 100,
  //   );
  //   try {
  //     Position position = await Geolocator.getCurrentPosition(
  //         locationSettings: locationSettings);
  //
  //     coordinates =
  //         'Latitude : ${position.latitude} \nLongitude : ${position.longitude}';
  //     latitude = position.latitude;
  //     longitude = position.longitude;
  //     print(coordinates);
  //
  //     List<Placemark> result =
  //         await placemarkFromCoordinates(position.latitude, position.longitude);
  //
  //     if (result.isNotEmpty) {
  //       address.value =
  //           '${result[0].name}, ${result[0].locality}, ${result[0].subAdministrativeArea}';
  //       print(address.value);
  //       print(result[0]);
  //     }
  //   } catch (e) {
  //     AlertCustomDialogs().showError(msg: e.toString());
  //   }
  //   EasyLoading.dismiss();
  }
}
