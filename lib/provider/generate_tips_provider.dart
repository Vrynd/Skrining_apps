import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:skrining_apps/models/tips_response.dart';
import 'package:skrining_apps/service/tips_service.dart';

class GenerateTipsProvider extends ChangeNotifier{
  final TipsService service;

  GenerateTipsProvider(this.service);
  TipsResponse? _answer;
  TipsResponse? get answer => _answer;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> generateAnswer(List<dynamic> inputData) async {
    _answer = null;
    _isLoading = true;
    notifyListeners();

    final response = await service.generateTips(inputData);
    debugPrint('ISI response = $response');
    final Map<String, dynamic> jsonMap = jsonDecode(response);
    debugPrint('ISI jsonMap = $jsonMap');
    _answer = TipsResponse.fromJson(jsonMap);
    _isLoading = false;
    notifyListeners();
  }
}