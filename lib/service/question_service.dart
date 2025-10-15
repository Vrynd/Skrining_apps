import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:skrining_apps/models/question.dart';
import 'package:skrining_apps/models/question_response.dart';

class QuestionService {
  final String assetPath = 'assets/question.json';

  Future<List<Question>> fetchQuestions() async {
    try {
      final String jsonString = await rootBundle.loadString(assetPath);
      final Map<String, dynamic> jsonMap = json.decode(jsonString);
      final questionsResponse = QuestionsResponse.fromJson(jsonMap);
      return questionsResponse.questions;
    } catch (e) {
      print("Error loading questions: $e");
      throw Exception("Gagal memuat data pertanyaan. Error: $e");
    }
  }
}