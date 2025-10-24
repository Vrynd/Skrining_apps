import 'package:skrining_apps/models/tips.dart';

class TipsResponse {
  Tips tips;

  TipsResponse({required this.tips});

  factory TipsResponse.fromJson(Map<String, dynamic> json) =>
      TipsResponse(tips: Tips.fromJson(json["tips"]));

  Map<String, dynamic> toJson() => {"tips": tips.toJson()};
}
