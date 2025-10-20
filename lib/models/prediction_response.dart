class PredictionResponse {
  String data;
  bool error;
  String message;

  PredictionResponse({
    required this.data,
    required this.error,
    required this.message,
  });

  factory PredictionResponse.fromJson(Map<String, dynamic> json) => PredictionResponse(
      data: json['data'] as String,
      error: json["error"],
      message: json["message"],
  );

  Map<String, dynamic> toJson() => {
      "error": error,
      "message": message,
      "data": data,
  };
}