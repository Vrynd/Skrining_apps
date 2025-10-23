class Option {
    String text;
    String alias;
    int value;

    Option({
        required this.text,
        required this.alias,
        required this.value,
    });

    factory Option.fromJson(Map<String, dynamic> json) => Option(
        text: json["text"],
        alias: json["alias"],
        value: json["value"],
    );

    Map<String, dynamic> toJson() => {
        "text": text,
        "alias": alias,
        "value": value,
    };
}