import 'package:skrining_apps/models/question.dart';

class QuestionsResponse {
    List<Question> questions;

    QuestionsResponse({
        required this.questions,
    });

    factory QuestionsResponse.fromJson(Map<String, dynamic> json) => QuestionsResponse(
        questions: List<Question>.from(json["questions"].map((x) => Question.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "questions": List<dynamic>.from(questions.map((x) => x.toJson())),
    };
}