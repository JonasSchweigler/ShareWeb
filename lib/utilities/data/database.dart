import 'package:flutter/material.dart';
import 'dart:io';
import 'package:permission_handler/permission_handler.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:shareweb/views/home.dart';

class DataBase {
  String imageUrl;
  String name;
  String adress;
  String provider;

  // final FirebaseAuth auth = FirebaseAuth.instance;
  //
  // Future<void> inputData() async {
  //   final User user = await auth.currentUser;
  //   final uid = await user.uid;
  //   userID = uid;
  //   print(userID);
  // }

  Future<void> uploadImage() async {
    final _storage = FirebaseStorage.instance;
    final _picker = ImagePicker();
    PickedFile image;
    //Check Permission
    await Permission.photos.request();
    var permissionStatus = await Permission.photos.status;
    if (permissionStatus.isGranted) {
      //selectImage
      image = await _picker.getImage(source: ImageSource.gallery);
      var file = File(image.path);
      if (image != null) {
        //Upload to Firebase
        var snapshot = await _storage.ref().child('/Image').putFile(file);

        var downloadURl = await snapshot.ref.getDownloadURL();
        imageUrl = downloadURl;
      } else {
        print('No path for image');
      }
    } else {
      print('Check your Permission');
    }
  }

  Future<void> addProvider({
    String name,
    String adress,
    String provider,
  }) async {
    var _firebaseRef = FirebaseDatabase().reference().child("Provider");
    var _firebaseRefproducts = _firebaseRef.child('products');
    Map<String, String> providerproducts = {'fdgr': 'rdse'};
    Map<String, String> providerinfo = {
      'providerName': name,
      'providerType': provider,
      'adress': adress,
      'imageURL': 'assets/images/Sweep.png',
    };

    _firebaseRef.push().set({providerinfo});
    _firebaseRefproducts.push().set({providerproducts});
  }
}
