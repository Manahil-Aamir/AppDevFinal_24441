import 'package:appdevfinal/providers/firestore_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'category_provider.g.dart';


// Stream provider for fetching todos
@riverpod
Stream<List<String>> todosCategoryStream(TodosCategoryStreamRef ref) {
  final firestoreService = ref.watch(firestoreServiceProvider);
  return firestoreService.getCategories();
}