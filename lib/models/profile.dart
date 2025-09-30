import 'package:cloud_firestore/cloud_firestore.dart';

class Profile {
  final String? uid;
  final String? fullname;
  final String? email;
  final String? photoUrl;
  final DateTime? birthDate;

  Profile({this.uid, this.fullname, this.email, this.photoUrl,this.birthDate});

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      uid: json['uid'],
      fullname: json['fullname'],
      email: json['email'],
      photoUrl: json['photoUrl'],
      birthDate: json['birthDate'] != null
          ? (json['birthDate'] as Timestamp).toDate()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'fullname': fullname,
      'email': email,
      'photoUrl': photoUrl,
      'birthDate': birthDate != null ? Timestamp.fromDate(birthDate!) : null,
    };
  }

  int? get age {
    if (birthDate == null) return null;
    final now = DateTime.now();
    int age = now.year - birthDate!.year;
    if (now.month < birthDate!.month ||
        (now.month == birthDate!.month && now.day < birthDate!.day)) {
      age--;
    }
    return age;
  }
}
