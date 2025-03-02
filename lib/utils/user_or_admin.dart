import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserOrAdmin {
  static final UserOrAdmin _instance = UserOrAdmin._internal();
  factory UserOrAdmin() => _instance;

  UserOrAdmin._internal();

  bool _isAdmin = false;

  bool get isAdmin => _isAdmin;

  /// Fetch user role from Firestore
  Future<void> init() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('user')
          .doc(user.uid)
          .get();

      if (userDoc.exists) {
        _isAdmin = userDoc['isAdmin'] ?? false;
      }
    }
  }

  /// Refresh the admin status (if needed)
  Future<void> refreshAdminStatus() async {
    await init();
  }
}
