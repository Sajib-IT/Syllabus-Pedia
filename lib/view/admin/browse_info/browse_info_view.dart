import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syllabus_pedia/view/admin/browse_info/widget/browse_info_widget.dart';
import 'package:syllabus_pedia/view/admin/search_history/search_history_widget.dart';
import 'package:syllabus_pedia/widgets/button/semester_button.dart';
import 'package:syllabus_pedia/widgets/ui_helper/ui_helper.dart';

class BrowseInfoView extends StatefulWidget {
  const BrowseInfoView({super.key});

  @override
  State<BrowseInfoView> createState() => _BrowseInfoViewState();
}

class _BrowseInfoViewState extends State<BrowseInfoView> {
  final TextEditingController _searchController = TextEditingController();
  String _searchText = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: UIHelper().drawAppbarTitle(title: "Browse Info"),
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search by Student ID',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _searchText = value.trim();
                });
              },
            ),
          ),
          // StreamBuilder to fetch and display data
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection('user').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }

                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return const Center(child: Text('No data found.'));
                }

                // Extract data from the snapshot
                final userDocs = snapshot.data!.docs;

                // Filter documents based on partial match of studentId
                final filteredUsers = userDocs.where((doc) {
                  final userData = doc.data() as Map<String, dynamic>;
                  final studentId = userData['studentId'] ?? '';
                  final isAdmin = userData['isAdmin'] ?? false;

                  // Only include non-admin users whose studentId partially matches the search text
                  return !isAdmin && studentId.contains(_searchText);
                }).toList();

                if (filteredUsers.isEmpty) {
                  return const Center(child: Text('No matching users found.'));
                }

                return ListView.builder(
                  itemCount: filteredUsers.length,
                  itemBuilder: (context, index) {
                    final userData = filteredUsers[index].data() as Map<String, dynamic>;
                    final studentId = userData['studentId'] ?? 'No Student ID';

                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: SemesterButton(
                        onTab: () {
                          Get.to(()=>BrowseInfoWidget(studentId: studentId));
                        },
                        text: studentId,
                        isCenter: false,
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
