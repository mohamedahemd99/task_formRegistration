import 'dart:io';

import 'package:flutter/material.dart';
// import 'package:flutter_sound/flutter_sound.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:your_app_name/local/cache_helper.dart';
import 'package:your_app_name/model/clinic_model.dart';
import 'package:your_app_name/model/grid_model.dart';
import 'package:your_app_name/presentation/resources/assets_manager.dart';

class WorkInfoProvider extends ChangeNotifier {
  List<Clinic> clinics = [];
  TextEditingController clinicNameController = TextEditingController();
  TextEditingController clinicAddressController = TextEditingController();
  TextEditingController clinicPhoneController = TextEditingController();
  String ? mainSpec;
  String ? subSpec;
  String ? scientificDeg;
  List<String> mainSpecialist = [
    "select your main Speciality",
    "Dermatology",
    "Pediatrics",
    "General/Clinical Pathology.",
  ];
  List<String> subSpecialist = [
    "select your sub Speciality",
    "Neuroanesthesiologists",
    "noseorthopedists",
    "urologists",
  ];
  List<String> scientificDegree = [
    "select your Scientific Degree",
    "PhD",
    "Sc.D",
    "D.Sc",
  ];

  void addToClinicList({Clinic? value}) {
    clinics.add(value!);
    notifyListeners();
  }
  void changeMainSpecialist(value) {
    mainSpec = value;
    notifyListeners();
  }
  void changeSubSpecialist(value) {
    subSpec = value;
    notifyListeners();
  }
  void changeDegree(value) {
    scientificDeg = value;
    notifyListeners();
  }
}
