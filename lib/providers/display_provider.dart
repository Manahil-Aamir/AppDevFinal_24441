import 'package:appdevfinal/providers/firestore_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:appdevfinal/models/todo.dart';
import 'package:appdevfinal/service/firebaseservice.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'display_provider.g.dart';


// Stream provider for fetching todos
@riverpod
Stream<List<ToDo>> todosStream(TodosStreamRef ref) {
  final firestoreService = ref.watch(firestoreServiceProvider);
  return firestoreService.getTodos();
}
