import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:skrining_apps/models/tips_response.dart';
import 'package:skrining_apps/service/tips_service.dart';

class GenerateTipsProvider extends ChangeNotifier{
  final TipsService service;

  GenerateTipsProvider(this.service);
  TipsResponse? _answer;
  TipsResponse? get answer => _answer;
  String? _errorMessage;
  String? get errorMessage => _errorMessage;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> generateAnswer(List<dynamic> inputData) async {
    _answer = null;
    _errorMessage = null;
    _isLoading = true;
    notifyListeners();
    try {
      final response = await service.generateTips(inputData);
      debugPrint('ISI response = $response');
      final Map<String, dynamic> jsonMap = jsonDecode(response);
      debugPrint('ISI jsonMap = $jsonMap');
      _answer = TipsResponse.fromJson(jsonMap);
      _errorMessage = null;
    } on Exception catch (e) {
      _errorMessage = e.toString().replaceFirst('Exception: ', '');
      _answer = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}