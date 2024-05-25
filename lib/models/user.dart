import 'package:cloud_firestore/cloud_firestore.dart';

class User{
  String name;
  String email;
  String password;

  User({
    required this.name,
    required this.email,
    required this.password,
  });

  factory User.fromQuerySnapshot(QueryDocumentSnapshot doc) {
    final Map<String, dynamic> json = doc.data() as Map<String, dynamic>;
    return User(
        name: json['name'] as String,
        email: json['email'] as String,
        password: json['password'] as String,
        );
  }
}