import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserOrAdmin {
  static final UserOrAdmin _instance = UserOrAdmin._internal();
  factory UserOrAdmin() => _instance;

  UserOrAdmin._internal();

  bool _isAdmin = false;
  String _studentId = '';

  bool get isAdmin => _isAdmin;
  String get studentId => _studentId;

  /// Fetch user role and studentId from Firestore
  Future<void> init() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('user')
          .doc(user.uid)
          .get();

      if (userDoc.exists) {
        _isAdmin = userDoc['isAdmin'] ?? false;
        _studentId = userDoc['studentId'] ?? '';
      }
    }
  }

  /// Refresh the admin status and studentId (if needed)
  Future<void> refreshUserData() async {
    await init();
  }
}
