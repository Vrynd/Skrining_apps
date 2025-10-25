import 'package:flutter/widgets.dart';
import 'package:skrining_apps/models/static_tips.dart';
import 'package:skrining_apps/service/static_tips_service.dart';

class StaticTipsProvider extends ChangeNotifier {
  final StaticTipsService _service;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  List<StaticTips> _tipsData = [];
  List<StaticTips> get tipsData => _tipsData;
  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  StaticTipsProvider(this._service);

  Future<void> loadStaticTips() async {
    _tipsData = [];
    _errorMessage = null;
    _isLoading = true;
    notifyListeners();

    try {
      final data = await _service.fetchStaticTips();
      _tipsData = data;
      _errorMessage = null;
    } catch (e) {
      _errorMessage = e.toString();
      _tipsData = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}