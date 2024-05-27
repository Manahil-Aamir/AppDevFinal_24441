import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:appdevfinal/models/todo.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Fetch todos as a stream
  Stream<List<ToDo>> getTodos(String category) {
    return _firestore.collection('todos')
      .where('category', isEqualTo: category)
      .snapshots()
      .map((snapshot) {
        return snapshot.docs.map((doc) {
          return ToDo.fromQuerySnapshot(doc);
        }).toList();
      });
  }

// Fetch unique categories as a stream
Stream<List<String>> getCategories() {
  return _firestore.collection('todos').snapshots().map((snapshot) {
    // Using a set to ensure unique categories
    Set<String> categories = {};
    for (var doc in snapshot.docs) {
      try {
        // Parsing the document data safely
        ToDo todo = ToDo.fromQuerySnapshot(doc);
        if (todo.category.isNotEmpty) {
          categories.add(todo.category);
        }
      } catch (e) {
        print('Error parsing todo: $e');
      }
    }
    return categories.toList();
  });
}


  // Add a new todo
  Future<void> addData(ToDo toDo) async {
    try {
      await _firestore.collection("todos").add(toDo.toMap());
    } catch (error) {
      print("error");
    }
  }

  // Update an existing todo
  Future<void> updateData(String documentId, ToDo toDo) async {
    try {
      await _firestore.collection("todos").doc(documentId).update(toDo.toMap());
    } catch (error) {
      print("error");
    }
  }

  // Remove a todo
  Future<void> removeData(String documentId) async {
    try {
      await _firestore.collection("todos").doc(documentId).delete();
    } catch (error) {
      print("error");
    }
  }
}
