import 'package:cloud_firestore/cloud_firestore.dart';

class ToDo{
  final String category;
  final String description;
  final String name;
   final String imageUrl;
    final int total;
    final int price;
    final String id;

  ToDo({
    required this.category,
    required this.description,
    required this.name,
    required this.total,
    required this.price,
    required this.imageUrl,
    required this.id,
  });

  factory ToDo.fromQuerySnapshot(QueryDocumentSnapshot doc) {
    final Map<String, dynamic> json = doc.data() as Map<String, dynamic>;
    return ToDo(
        category: json['category'] as String,
        description: json['description'] as String,
        name: json['name'] as String,
        id: json['id'] as String,
        imageUrl: json['imageUrl'] as String,
        price: json['price'] as int,
        total: json['total'] as int
        );
  }

    Map<String, dynamic> toMap() {
    return {
      'name': name,
      'category': category,
      'description': description,
      'imageUrl': imageUrl,
      'price': price,
      'total': total,
      'id' : id,
    };
  }
}