import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:appdevfinal/models/todo.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Fetch todos as a stream
  Stream<List<ToDo>> getTodos() {
    return _firestore.collection('todos').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return ToDo.fromQuerySnapshot(doc);
      }).toList();
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
