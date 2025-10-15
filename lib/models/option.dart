class Option {
    String text;
    int value;

    Option({
        required this.text,
        required this.value,
    });

    factory Option.fromJson(Map<String, dynamic> json) => Option(
        text: json["text"],
        value: json["value"],
    );

    Map<String, dynamic> toJson() => {
        "text": text,
        "value": value,
    };
}