import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path_provider/path_provider.dart';

class StorageService{
  final storageRef = FirebaseStorage.instance.ref();

  uploadProfileImage(String filePath,String fileName, User user) async{
    final profileRef = storageRef.child(fileName);
    File file = File(filePath);

    await profileRef.putFile(file);
    String photoURL = await profileRef.getDownloadURL();
    user.updatePhotoURL(photoURL);
    print('Image URL here...');
    print(photoURL);
  }


}

