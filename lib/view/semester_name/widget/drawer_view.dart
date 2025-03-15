
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syllabus_pedia/utils/user_or_admin.dart';
import 'package:syllabus_pedia/view/admin/search_history/search_history_view.dart';
import 'package:syllabus_pedia/view/feedback/admin_feedback.dart';
import 'package:syllabus_pedia/view/feedback/user_feedback.dart';
import 'package:syllabus_pedia/view/profile/profile_view.dart';
import 'package:syllabus_pedia/view/semester_name/semester_name_controller.dart';

class DrawerView extends StatelessWidget {
  final SemesterNameController _semesterNameController = Get.find();
  DrawerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.blue.shade50,
      width: Get.width * 65 / 100,
      child: Column(
        children: [
          Obx(()=>UserAccountsDrawerHeader(
            accountName: Text(
              _semesterNameController.user.value!.name,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            accountEmail: Text(
              _semesterNameController.user.value!.email,
              style: const TextStyle(fontSize: 14),
            ),
            // currentAccountPicture: CircleAvatar(
            //   backgroundImage: (_dashboardController.user.profileImageUrl ==
            //           null)
            //       ? const AssetImage('assets/img/demo.png')
            //       : NetworkImage(_dashboardController.user.profileImageUrl!),
            // ),
            decoration: BoxDecoration(
              color: Colors.blue.shade900,
            ),
          ) )
          ,
          // Drawer Items
          if(UserOrAdmin().isAdmin)
            ListTile(
              leading: const Icon(Icons.person, color: Colors.blueAccent),
              title: const Text(
                "Search History",
                style: TextStyle(fontSize: 16),
              ),
              onTap: () {
                Get.back();
                Get.to(() => SearchHistoryView());
              },
            ),
          if(UserOrAdmin().isAdmin)
            ListTile(
              leading: const Icon(Icons.person, color: Colors.blueAccent),
              title: const Text(
                "Feedback",
                style: TextStyle(fontSize: 16),
              ),
              onTap: () {
                Get.back();
                Get.to(() => AdminFeedback() );
              },
            ),
          if(UserOrAdmin().isAdmin)
            ListTile(
              leading: const Icon(Icons.person, color: Colors.blueAccent),
              title: const Text(
                "Browse Info",
                style: TextStyle(fontSize: 16),
              ),
              onTap: () {
                Get.back();
              },
            ),
          if(!UserOrAdmin().isAdmin)
          ListTile(
            leading: const Icon(Icons.person, color: Colors.blueAccent),
            title: const Text(
              "Profile",
              style: TextStyle(fontSize: 16),
            ),
            onTap: () {
              Get.back();
              Get.to(() => ProfileView());
              // ScaffoldMessenger.of(context).showSnackBar(
              //   const SnackBar(content: Text("Profile clicked")),
              // );
            },
          ),
          if(!UserOrAdmin().isAdmin)
          ListTile(
            leading: const Icon(Icons.feedback, color: Colors.blueAccent),
            title: const Text(
              "Send Feedback",
              style: TextStyle(fontSize: 16),
            ),
            onTap: () {
              // Handle Request tap
              Get.back();
              Get.to(() => UserFeedback());
              // Navigator.pop(context);
              // ScaffoldMessenger.of(context).showSnackBar(
              //   const SnackBar(content: Text("Request clicked")),
              // );
            },
          ),
          ListTile(
            leading: const Icon(Icons.feed, color: Colors.blueAccent),
            title: const Text(
              "About us",
              style: TextStyle(fontSize: 16),
            ),
            onTap: () {
              // Handle Contact tap
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Contact clicked")),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.blueAccent),
            title: const Text(
              "Logout",
              style: TextStyle(fontSize: 16),
            ),
            onTap: () {
              // Handle Logout tap
              Navigator.pop(context);
              FirebaseAuth.instance.signOut();
              Get.delete<SemesterNameController>();
            },
          ),
        ],
      ),
    );
  }
}
