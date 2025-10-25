import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:skrining_apps/models/static_tips.dart';
import 'package:skrining_apps/models/static_tips_response.dart';

class StaticTipsService {
  final String assetPath = 'assets/static_tips.json';

  Future<List<StaticTips>> fetchStaticTips() async {
    try {
      final String jsonString = await rootBundle.loadString(assetPath);
      final Map<String, dynamic> jsonMap = json.decode(jsonString);
      final response = StaticTipsResponse.fromJson(jsonMap);
      List<StaticTips> responseData = [];
      responseData.add(response.suggestionLow);
      responseData.add(response.suggestionHigh);
      return responseData;
    } catch (e) {
      throw Exception("Gagal memuat data tips. Error: $e");
    }
  }
}