import 'dart:io' as io;
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class MedicalProvider extends ChangeNotifier {
  List<String> diagnosis = [];
  List<String> medications = [];
  List<String> operations = [];
  io.File? video;
  String? videoImageUrl;
  String? voiceImageUrl;
  var picker = ImagePicker();

  void addToMedicalList({String? status = "diagnosis", String? value}) {
    if (status == "diagnosis") {
      diagnosis.add(value!);
    } else if (status == "medications") {
      medications.add(value!);

    } else if (status == "operations") {
      operations.add(value!);

    }
    notifyListeners();
  }

  Future<void> getPickedVideo() async {
    final pickedFile = await picker.getVideo(source: ImageSource.gallery);
    if (pickedFile != null) {
      video = io.File(pickedFile.path);
      notifyListeners();

      uploadVideo(video!);

      notifyListeners();
    } else {
      notifyListeners();
    }
  }

  void uploadVideo(io.File imageFile) {
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('videos/${Uri.file(imageFile.path).pathSegments.last}')
        .putFile(imageFile)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        videoImageUrl = value;


        notifyListeners();
      }).catchError((error) {

        notifyListeners();
      });
    }).catchError((error) {

      notifyListeners();
    });
  }

  String? audioUrl;
  bool audioLoading = false;
  io.File? audioFile;

  void changeFile(io.File imageFile) {
    audioFile = imageFile;
    notifyListeners();
  }

  void uploadAudio(io.File imageFile, BuildContext context) {
    audioLoading = true;
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('audio/${Uri.file(imageFile.path).pathSegments.last}')
        .putFile(imageFile)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        voiceImageUrl = value;

        audioUrl = value;

        Navigator.of(context).pop();
        audioLoading = false;

        notifyListeners();
      }).catchError((error) {
        audioLoading = false;


        notifyListeners();
      });
    }).catchError((error) {
      audioLoading = false;


      notifyListeners();
    });
  }

}
