import 'package:audioplayers/audioplayers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../local/cache_helper.dart';
import '../model/clinic_model.dart';
import '../model/user_data_model.dart';

class ProfileProvider extends ChangeNotifier {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  UserDataModel? userModel;
  List<Clinic>? clinics;
  List<String>? diagnosis;
  List<String>? medications;
  List<String>? operations;

  //addUser//
  Future<void> getUserData() async {
    // Call the user's CollectionReference to add a new user

    users
        .doc(CacheHelper.getData(key: 'uid'))
        .collection("userData")
        .snapshots()
        .listen((event) {
      userModel = (UserDataModel.fromJson(event.docs[0].data()));
      notifyListeners();
    }).onError((error) {

    });
  }

  void getClinicsData() {
    // set on my chat
    users
        .doc(CacheHelper.getData(key: 'uid'))
        .collection("clinicData")
        .snapshots()
        .listen((event) {
      clinics = [];
      for (var element in event.docs) {
        clinics!.add(Clinic.fromJson(element.data()));
        notifyListeners();
      }
      notifyListeners();
    }).onError((error) {

    });
  }

  void getDiagnosisData() {
    // set on my chat
    users
        .doc(CacheHelper.getData(key: 'uid'))
        .collection("diagnosis")
        .snapshots()
        .listen((event) {
      diagnosis = [];
      for (var element in event.docs) {
        diagnosis!.add(element.data()["diagnosis"]);
        notifyListeners();
      }
      notifyListeners();
    }).onError((error) {

    });
  }

  void getMedicationData() {
    // set on my chat
    users
        .doc(CacheHelper.getData(key: 'uid'))
        .collection("medication")
        .snapshots()
        .listen((event) {
      medications = [];
      for (var element in event.docs) {
        medications!.add(element.data()["medication"]);
        notifyListeners();
      }
      notifyListeners();
    }).onError((error) {

    });
  }

  void getOperationData() {
    // set on my chat
    users
        .doc(CacheHelper.getData(key: 'uid'))
        .collection("operation")
        .snapshots()
        .listen((event) {
      operations = [];
      for (var element in event.docs) {
        operations!.add(element.data()["operation"]);
        notifyListeners();

      }
      notifyListeners();
    }).onError((error) {

    });
  }

  final player = AudioPlayer();

  void start(url) async {
    await player.setSourceUrl(url); // equivalent to setSource(UrlSource(url));
    notifyListeners();
  }

  void changePlayerValue() {
    isPlaying = !isPlaying;
    notifyListeners();
  }

  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  void init() async {
    player.onPlayerStateChanged.listen((event) {
      isPlaying = event == PlayerState.playing;
      notifyListeners();
    });
    player.onDurationChanged.listen((event) {
      duration = event;
      notifyListeners();
    });
    player.onPositionChanged.listen((event) {
      position = event;
      notifyListeners();
    });
  }

  void toggle(url) async {
    if (!isPlaying) {
      await player.play(UrlSource(url)); // equivalent to setSource(UrlSource(url));
      notifyListeners();
    } else {
      await player.pause(); // will resume from beginning
      notifyListeners();
    }
  }
}
