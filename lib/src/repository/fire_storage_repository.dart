import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class FireStorageRepository {
  firebase_storage.UploadTask uploalImageFile(
      String uid, String filename, File file) {
    firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
        .ref()
        .child('user/$uid')
        .child('/$filename.jpg');

    // final metadata = firebase_storage.SettableMetadata(
    //     contentType: 'image/jpeg',
    //     customMetadata: {'picked-file-path': file.path});

    //return ref.putFile(file, metadata);
    return ref.putFile(file);
  }
}
