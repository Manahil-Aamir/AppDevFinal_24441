import 'package:cloud_firestore/cloud_firestore.dart';

class ToDo{
  String title;
  String description;
  String name;
  String id;

  ToDo({
    required this.title,
    required this.description,
    required this.name,
    required this.id,
  });

  factory ToDo.fromQuerySnapshot(QueryDocumentSnapshot doc) {
    final Map<String, dynamic> json = doc.data() as Map<String, dynamic>;
    return ToDo(
        title: json['title'] as String,
        description: json['description'] as String,
        name: json['name'] as String,
        id: doc.id
        );
  }

    Map<String, dynamic> toMap() {
    return {
      'name': name,
      'title': title,
      'description': description,
    };
  }
}