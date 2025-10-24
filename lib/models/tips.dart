class Tips {
  String age;
  String sex;
  String chestPainType;
  String cholesterol;
  String fastingBs;
  String restingEcg;
  String maxHr;
  String exerciseAngina;
  String oldpeak;
  String stSlope;
  String summary;

  Tips({
    required this.age,
    required this.sex,
    required this.chestPainType,
    required this.cholesterol,
    required this.fastingBs,
    required this.restingEcg,
    required this.maxHr,
    required this.exerciseAngina,
    required this.oldpeak,
    required this.stSlope,
    required this.summary,
  });

  factory Tips.fromJson(Map<String, dynamic> json) => Tips(
    age: json["age"],
    sex: json["sex"],
    chestPainType: json["chestPainType"],
    cholesterol: json["cholesterol"],
    fastingBs: json["fastingBS"],
    restingEcg: json["restingECG"],
    maxHr: json["maxHR"],
    exerciseAngina: json["exerciseAngina"],
    oldpeak: json["oldpeak"]?.toDouble(),
    stSlope: json["ST_Slope"],
    summary: json["summary"],
  );

  Map<String, dynamic> toJson() => {
    "age": age,
    "sex": sex,
    "chestPainType": chestPainType,
    "cholesterol": cholesterol,
    "fastingBS": fastingBs,
    "restingECG": restingEcg,
    "maxHR": maxHr,
    "exerciseAngina": exerciseAngina,
    "oldpeak": oldpeak,
    "ST_Slope": stSlope,
    "summary": summary,
  };
}
