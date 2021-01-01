import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:firecorder/services/auth_service.dart';

class StorageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final AuthService _auth = AuthService();

  Future<List<String>> get userRecordings async {
    final String uid = await _auth.uid;
    final ListResult result = await _storage.ref('users/$uid').listAll();
    List<String> names =
        await Future.wait(result.items.map((Reference ref) async {
      return (await ref.getMetadata()).name;
    }));
    return names;
  }

  Future<void> uploadRecording({String name, File file}) async {
    final String uid = (await _auth.userStream.first).uid;
    try {
      await _storage.ref('users/$uid/$name').putFile(file);
    } on FirebaseException catch (e) {
      print(e.toString());
    }
  }
}
