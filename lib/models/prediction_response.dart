class PredictionResponse {
  int? prediction;
  double? probability;
  String? message;

  PredictionResponse({
    this.prediction,
    this.probability,
    this.message,
  });

  factory PredictionResponse.fromJson(Map<String, dynamic> json) => PredictionResponse(
      prediction: json['prediction'] as int?,
      probability: json['probability'] as double?,
      message: json["error"] as String?,
  );

  Map<String, dynamic> toJson() => {
      "prediction": prediction,
      "probability": probability,
      "error": message,
  };
}