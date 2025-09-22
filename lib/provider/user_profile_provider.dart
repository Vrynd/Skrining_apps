// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

class UserProfileProvider with ChangeNotifier {
  // User? _user;
  bool _isLoading = false;

  // User? get user => _user;
  bool get isLoading => _isLoading;

  UserProfileProvider() {
    _loadUser();
  }

  Future<void> _loadUser() async {
    _isLoading = true;
    notifyListeners();
    // _user = FirebaseAuth.instance.currentUser;
    _isLoading = false;
    notifyListeners();
  }

  Future<void> signOut() async {
    // await FirebaseAuth.instance.signOut();
    // _user = null;
    notifyListeners();
  }
}