// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

class PasswordChangeProvider with ChangeNotifier {
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  bool _isLoading = false;
  String? _errorMessage;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> changePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    _isLoading = true;
    notifyListeners();
    try {
      // User? user = _auth.currentUser;
      // if (user != null) {
        // AuthCredential credential = EmailAuthProvider.credential(
        //   email: user.email!,
        //   password: oldPassword,
        // );
        // await user.reauthenticateWithCredential(credential);

        // await user.updatePassword(newPassword);
        // await user.reload();

        _isLoading = false;
        notifyListeners();
      // }
    } catch (e) {
      _errorMessage = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }
}