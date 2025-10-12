import 'dart:async';
import 'package:flutter/material.dart';

class TimeProvider extends ChangeNotifier {
  DateTime _currentTime = DateTime.now();

  DateTime get currentTime => _currentTime;

  late final Timer _timer = Timer.periodic(
    const Duration(seconds: 1),
    (_) {
      _currentTime = DateTime.now();
      notifyListeners();
    },
  );

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
