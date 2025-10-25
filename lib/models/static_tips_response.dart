import 'package:skrining_apps/models/static_tips.dart';

class StaticTipsResponse {
    StaticTips suggestionLow;
    StaticTips suggestionHigh;

    StaticTipsResponse({
        required this.suggestionLow,
        required this.suggestionHigh,
    });

    factory StaticTipsResponse.fromJson(Map<String, dynamic> json) => StaticTipsResponse(
        suggestionLow: StaticTips.fromJson(json["suggestion_low"]),
        suggestionHigh: StaticTips.fromJson(json["suggestion_high"]),
    );

    Map<String, dynamic> toJson() => {
        "suggestion_low": suggestionLow.toJson(),
        "suggestion_high": suggestionHigh.toJson(),
    };
}