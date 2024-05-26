// todo_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:appdevfinal/models/todo.dart';
import 'package:appdevfinal/service/firebaseservice.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:appdevfinal/providers/firestore_provider.dart';

part 'todo_provider.g.dart';

@riverpod
class TodoNotifier extends _$TodoNotifier {
  late FirestoreService _firestoreService;

  @override
  List<ToDo> build() {
    _firestoreService = ref.read(firestoreServiceProvider);  // Using ref.read for initial read
    _fetchTodos();
    return [];
  }

  // Fetch todos as a stream and update the state
  void _fetchTodos() {
    _firestoreService.getTodos().listen((todos) {
      state = todos;
    });
  }

  // Add a new todo
  Future<void> addData(ToDo toDo) async {
    try {
      await _firestoreService.addData(toDo);
    } catch (error) {
      throw error;
    }
  }

  // Update an existing todo
  Future<void> updateData(String documentId, ToDo toDo) async {
    try {
      await _firestoreService.updateData(documentId, toDo);
    } catch (error) {
      throw error;
    }
  }

  // Remove a todo
  Future<void> removeData(String documentId) async {
    try {
      await _firestoreService.removeData(documentId);
    } catch (error) {
      throw error;
    }
  }
}
