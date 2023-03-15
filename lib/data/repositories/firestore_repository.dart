import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class FirestoreRepository {
  final _firestore = FirebaseFirestore.instance;

  Future<bool> isProfileNameExists(String name) async {
    try {
      final doc = await _firestore.collection('profile_names').doc(name).get();
      return doc.exists;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
