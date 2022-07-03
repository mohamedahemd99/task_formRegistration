import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import '../local/cache_helper.dart';
import 'medical_provider.dart';
import 'work_info_provider.dart';
import '../model/clinic_model.dart';
import '../model/user_data_model.dart';
import '../presentation/helper/api_service.dart';
import '../presentation/resources/routes_manager.dart';

class SignUpProvider extends ChangeNotifier {
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  File? profileImage;
  File? certificationImage;
  File? licenceImage;
  String? profileImageUrl;
  String? certificateImageUrl;
  String? licenseImageUrl;
  bool loading = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  var picker = ImagePicker();

  Future<void> getPickedImage({String typeOfImage = "profile"}) async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      if (typeOfImage == "profile") {
        profileImage = File(pickedFile.path);
        uploadImage(profileImage!, typeOfImage: typeOfImage);
      } else if (typeOfImage == "certification") {
        certificationImage = File(pickedFile.path);
        uploadImage(certificationImage!, typeOfImage: typeOfImage);

      } else if (typeOfImage == "license") {
        licenceImage = File(pickedFile.path);
        uploadImage(licenceImage!, typeOfImage: typeOfImage);
      }
      notifyListeners();
    } else {
      notifyListeners();
    }
  }

  void uploadImage(File imageFile, {typeOfImage = "profile"}) {
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child(typeOfImage == "profile"
            ? 'userImages/${Uri.file(imageFile.path).pathSegments.last}'
            : typeOfImage == "certification"
                ? 'certificates/${Uri.file(imageFile.path).pathSegments.last}'
                : 'license/${Uri.file(imageFile.path).pathSegments.last}')
        .putFile(imageFile)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        if (typeOfImage == "profile") {
          profileImageUrl = value;
        } else if (typeOfImage == "certification") {
          certificateImageUrl = value;
        } else if (typeOfImage == "license") {
          licenseImageUrl = value;
        }

        notifyListeners();
      }).catchError((error) {

        notifyListeners();
      });
    }).catchError((error) {

      notifyListeners();
    });
  }

  //addUser//
  Future<void> addUser({
    UserDataModel? model,
    String? uid,
    required BuildContext context,
  }) {
    // Call the user's CollectionReference to add a new user

    return users
        .doc(uid)
        .collection("userData")
        .add(
          model!.toJson(),
        )
        .then((value) {
      Provider.of<WorkInfoProvider>(context, listen: false)
          .clinics
          .forEach((clinic) {
        addClinicsData(clinic: clinic, context: context, uid: uid);
      });
      Provider.of<MedicalProvider>(context, listen: false)
          .diagnosis
          .forEach((diagnosis) {
        addDiagnosisData(diagnosis: diagnosis, context: context, uid: uid);
        notifyListeners();
      });
      Provider.of<MedicalProvider>(context, listen: false)
          .medications
          .forEach((medications) {
        addMedicationData(medication: medications, context: context, uid: uid);
        notifyListeners();
      });
      Provider.of<MedicalProvider>(context, listen: false)
          .operations
          .forEach((operation) {
        addOperationData(operation: operation, context: context, uid: uid);
        notifyListeners();
      });

      notifyListeners();
    }).catchError((error) {
      notifyListeners();

      loading = false;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            error.toString(),
          ),
        ),
      );
    });
  }

  void addClinicsData(
      {Clinic? clinic, String? uid, required BuildContext context}) {
    // set on my chat
    users.doc(uid).collection("clinicData").add(clinic!.toJson()).then((value) {
      notifyListeners();
    }).catchError((error) {
      loading = false;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            error.toString(),
          ),
        ),
      );
      notifyListeners();

    });
  }

  void addDiagnosisData(
      {String? diagnosis, required BuildContext context, String? uid}) {
    // set on my chat
    users
        .doc(uid)
        .collection("diagnosis")
        .add({"diagnosis": diagnosis}).then((value) {
      notifyListeners();
    }).catchError((error) {
      loading = false;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            error.toString(),
          ),
        ),
      );
      notifyListeners();

    });
  }

  void addMedicationData({
    String? medication,
    required BuildContext context,
    String? uid,
  }) {
    // set on my chat
    users
        .doc(uid)
        .collection("medication")
        .add({"medication": medication}).then((value) {
      notifyListeners();
    }).catchError((error) {
      loading = false;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            error.toString(),
          ),
        ),
      );
      notifyListeners();

    });
  }

  void addOperationData({
    String? operation,
    required BuildContext context,
    String? uid,
  }) {
    // set on my chat
    users
        .doc(uid)
        .collection("operation")
        .add({"operation": operation}).then((value) {
      loading = false;
      Navigator.of(context).pushNamed(Routes.mainRoute);
      notifyListeners();
    }).catchError((error) {
      loading = false;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            error.toString(),
          ),
        ),
      );
      notifyListeners();

    });
  }

  void signUp(
      {required String email,
      required String password,
      UserDataModel? userModel,
      required context}) async {
    loading = true;
    notifyListeners();
    await Auth().createUser(email, password).then((user) async {
      addUser(model: userModel, context: context,uid: user.uid).then((value) {
        CacheHelper.putData(key: 'uid', value:user.uid);
        notifyListeners();
      }).catchError((error){

        notifyListeners();
      });
      notifyListeners();
    }).catchError((error) {
      loading = false;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            error.toString(),
          ),
        ),
      );

      notifyListeners();
    });
  }
}
