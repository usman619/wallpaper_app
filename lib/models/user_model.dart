import 'dart:convert';

class UserModel {
  final int? id;
  final String googleId;
  final String email;
  final String name;
  final String photoUrl;

  UserModel({
    this.id,
    required this.googleId,
    required this.email,
    required this.name,
    required this.photoUrl,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'google_id': googleId,
      'email': email,
      'name': name,
      'photo_url': photoUrl,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as int?,
      googleId: map['google_id'] as String,
      email: map['email'] as String,
      name: map['name'] as String,
      photoUrl: map['photo_url'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
