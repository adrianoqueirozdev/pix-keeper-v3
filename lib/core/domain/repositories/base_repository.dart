import 'package:cloud_firestore/cloud_firestore.dart';

abstract class BaseRepository {
  late FirebaseFirestore db;
  final String userId;

  BaseRepository({required this.userId}) {
    db = FirebaseFirestore.instance;
  }

  T fromFirestore<T>(DocumentSnapshot doc, T Function(Map<String, dynamic>) fromJson) {
    try {
      final data = doc.data() as Map<String, dynamic>;
      return fromJson(data);
    } catch (e) {
      throw Exception('Failed to parse document: $e');
    }
  }
}
