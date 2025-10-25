class StaticTips {
    List<String> bullets;

    StaticTips({
        required this.bullets,
    });

    factory StaticTips.fromJson(Map<String, dynamic> json) => StaticTips(
        bullets: List<String>.from(json["bullets"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "bullets": List<dynamic>.from(bullets.map((x) => x)),
    };
}