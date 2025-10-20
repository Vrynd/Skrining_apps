import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:skrining_apps/models/prediction_response.dart';

class ApiServices {
  static const String _baseUrl = "https://mariette-pharmacologic-felly.ngrok-free.dev";

  Future<PredictionResponse> postPredictionData({
    required List<dynamic> inputData,
  }) async {
    // 1. Persiapkan Payload (Data JSON yang akan dikirim)
    final Map<String, dynamic> payload = {
      // Sesuaikan dengan yang diharapkan oleh backend
      'features': inputData,
      'user_id': 'user_flutter_123',
    };

    final String jsonPayload = jsonEncode(payload);
    try {
      final response = await http.post(
        Uri.parse(_baseUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonPayload,
      );
      if (response.statusCode == 200) {
        final responseData = PredictionResponse.fromJson(jsonDecode(response.body));
        return responseData;
      } else {
        print('Gagal mengirim data. Status: ${response.statusCode}');
        throw Exception('Failed to get prediction: Status ${response.statusCode}');
      }
    } catch (e) {
      print('Error saat request: $e');
      throw Exception('Connection error during prediction request: $e');
    }
  }
}