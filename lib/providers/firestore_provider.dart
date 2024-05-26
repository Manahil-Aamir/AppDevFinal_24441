import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:appdevfinal/service/firebaseservice.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firestore_provider.g.dart';
@riverpod
FirestoreService firestoreService(FirestoreServiceRef ref) {
  // Create and return an instance of FirestoreService here
  return FirestoreService();
}
