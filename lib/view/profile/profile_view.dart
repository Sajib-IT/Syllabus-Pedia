import 'package:syllabus_pedia/view/profile/edit_profile/edit_profile_view.dart';
import 'package:syllabus_pedia/view/profile/profile_controller.dart';
import 'package:syllabus_pedia/view/profile/widgets/profile_info_row.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileView extends StatelessWidget {
  final ProfileController _controller = Get.put(ProfileController());
  ProfileView({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => EditProfileView(),
                  arguments: _controller.user.value);
            },
            icon: const Icon(Icons.edit),
          ),
        ],
      ),
      body: Obx(() => _controller.user.value != null
          ? SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // Center(
                  //   child: !_controller.isImageLoading.value
                  //       ? Stack(
                  //           alignment: Alignment.bottomRight,
                  //           children: [
                  //             CircleAvatar(
                  //               radius: 50,
                  //               backgroundImage: (_controller
                  //                           .user.value!.profileImageUrl ==
                  //                       null)
                  //                   ? const AssetImage('assets/img/demo.png')
                  //                   : NetworkImage(_controller
                  //                       .user.value!.profileImageUrl!),
                  //             ),
                  //             Positioned(
                  //               right: 8,
                  //               bottom: 6,
                  //               child: GestureDetector(
                  //                 onTap: () {
                  //                   _controller.changeProfilePicture();
                  //                 },
                  //                 child: Container(
                  //                   padding: const EdgeInsets.all(3),
                  //                   decoration: BoxDecoration(
                  //                     shape: BoxShape.circle,
                  //                     color: Colors.red.shade100,
                  //                   ),
                  //                   child: const Icon(
                  //                     Icons.camera_alt_outlined,
                  //                     color: Colors.red,
                  //                     size: 18,
                  //                   ),
                  //                 ),
                  //               ),
                  //             ),
                  //           ],
                  //         )
                  //       : const CircularProgressIndicator(
                  //           color: Colors.red,
                  //         ),
                  // ),
                  const SizedBox(height: 20),
                  ProfileInfoRow(
                    label: "Name",
                    value: _controller.user.value!.name,
                  ),
                  ProfileInfoRow(
                    label: "Email",
                    value: _controller.user.value!.email,
                  ),
                  ProfileInfoRow(
                    label: "Student Id",
                    value: _controller.user.value!.studentId!,
                  ),
                  ProfileInfoRow(
                    label: "Session",
                    value: _controller.user.value!.session!,
                  ),
                  ProfileInfoRow(
                    label: "Education Year",
                    value: "${_controller.user.value?.year} ${_controller.user.value?.semester}",
                  ),

                  // Obx(
                  //   () => ProfileInfoRow(
                  //     label: "Live Address",
                  //     value: _controller.address.value ?? "",
                  //   ),
                  // ),
                ],
              ),
            )
          : const Center(
              child: CircularProgressIndicator(),
            )),
    );
  }
}
