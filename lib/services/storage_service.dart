import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firecorder/services/auth_service.dart';

class StorageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
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
      TaskSnapshot task = await _storage.ref('users/$uid/$name').putFile(file);
      String recordingLink = await task.ref.getDownloadURL();
      CollectionReference recordings = _firestore.collection('recordings');
      await recordings.add({
        'uid': uid,
        'recording_name': name,
        'recording_link': recordingLink,
      });
    } catch (e) {
      print(e.toString());
    }
  }
}
