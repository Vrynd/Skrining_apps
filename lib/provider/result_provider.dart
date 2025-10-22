import 'package:flutter/foundation.dart';

class ResultProvider extends ChangeNotifier {
  int _notificationCount = 0;

  int get notificationCount => _notificationCount;

  void addNotification() {
    _notificationCount = 1;
    notifyListeners();
  }

  void clearNotification() {
    _notificationCount = 0;
    notifyListeners();
  }
}
