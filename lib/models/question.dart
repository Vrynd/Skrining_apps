import 'package:skrining_apps/models/option.dart';

class Question {
    int id;
    String question;
    String? hintText;
    AnswerType answerType;
    String? keyboardType;
    bool required;
    List<Option>? options;

    Question({
        required this.id,
        required this.question,
        this.hintText,
        required this.answerType,
        this.keyboardType,
        required this.required,
        this.options,
    });

    factory Question.fromJson(Map<String, dynamic> json) => Question(
        id: json["id"],
        question: json["question"],
        hintText: json["hint"],
        answerType: answerTypeValues.map[json["answer_type"]]!,
        keyboardType: json["keyboard_type"],
        required: json["required"],
        options: json["options"] == null ? [] : List<Option>.from(json["options"]!.map((x) => Option.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "question": question,
        "hint": hintText,
        "answer_type": answerTypeValues.reverse[answerType],
        "keyboard_type": keyboardType,
        "required": required,
        "options": options == null ? [] : List<dynamic>.from(options!.map((x) => x.toJson())),
    };
}

enum AnswerType {
    option,
    text
}

final answerTypeValues = EnumValues({
    "option": AnswerType.option,
    "text": AnswerType.text
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
