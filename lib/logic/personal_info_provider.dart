import 'dart:io';

import 'package:flutter/material.dart';
// import 'package:flutter_sound/flutter_sound.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:your_app_name/local/cache_helper.dart';
import 'package:your_app_name/model/clinic_model.dart';
import 'package:your_app_name/model/grid_model.dart';
import 'package:your_app_name/presentation/resources/assets_manager.dart';

class PersonalInfoProvider extends ChangeNotifier {
  TextEditingController iDController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController personalAddressController = TextEditingController();
  List<String> cities = [
    "select your city",
    "Alexandria",
    "Cairo",
    "Helwan",
    "Sharm"
  ];
  String? idType="passport";
  String? city;
  String? region;
  String? date;
  String? countryCode="+20";
  List<String> regions = [
    "select your region",
    "makrm",
    "masr el gdidi",
    "madint nasr",
  ];

  bool isMale = true;
  bool female = false;
  String gender="Male";

  void changeIDType(value) {
    idType = value;
    notifyListeners();
  }
  void changeCountryCode(value) {
    countryCode = value;
    notifyListeners();
  }

  void changeCity(value) {
    city = value;
    notifyListeners();
  }

  void changeRegion(value) {
    region = value;
    notifyListeners();
  }

  void changeDate(value) {
    date = value;
    notifyListeners();
  }

  void checkFemale(bool gender1) {
    if (gender1 == true) {
      isMale = false;
      female = true;
      gender="Female";
    } else {
      isMale = true;
      female = false;
      gender="Male";

    }
    notifyListeners();
  }

  void checkMale(bool gender1) {
    if (gender1 == true) {
      isMale = true;
      female = false;
      gender="Male";

    } else {
      isMale = false;
      female = true;
      gender="Female";

    }
    notifyListeners();
  }
}
