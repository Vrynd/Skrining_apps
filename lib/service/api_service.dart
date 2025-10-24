import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:skrining_apps/models/prediction_response.dart';

class ApiServices {
  static const String _baseUrl = "https://mariette-pharmacologic-felly.ngrok-free.dev/predict";

  Future<PredictionResponse> postPredictionData({
    required List<dynamic> inputData,
  }) async {
    final Map<String, dynamic> payload = {
      'Age': inputData[0],
      'Sex': inputData[1],
      'ChestPainType': inputData[2],
      'RestingBP': inputData[3],
      'Cholesterol': inputData[4],
      'FastingBS': inputData[5],
      'RestingECG': inputData[6],
      'MaxHR': inputData[7],
      'ExerciseAngina': inputData[8],
      'Oldpeak': inputData[9],
      'ST_Slope': inputData[10],
    };

    final String jsonBody = jsonEncode(payload);
    try {
      final response = await http.post(
        Uri.parse(_baseUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonBody,
      );
      if (response.statusCode == 200) {
        final responseData = PredictionResponse.fromJson(jsonDecode(response.body));
        return responseData;
      } else {
        throw Exception('Failed to get prediction: Status ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Connection error during prediction request: $e');
    }
  }
}