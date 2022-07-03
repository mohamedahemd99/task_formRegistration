import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../logic/lang_provider.dart';
import '../../../logic/medical_provider.dart';
import '../../../logic/personal_info_provider.dart';
import '../../../logic/sign_up_provider.dart';
import '../../../logic/work_info_provider.dart';
import '../../../model/user_data_model.dart';
import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/styles_manager.dart';
import '../../resources/values_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'medical_info.dart';
import 'personal_info.dart';
import 'work_info.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // final GlobalKey<FormState> personalFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> workFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var appLoc = AppLocalizations.of(context)!;
    var signupProvider = Provider.of<SignUpProvider>(context);
    var personalProvider = Provider.of<PersonalInfoProvider>(context);
    var workProvider = Provider.of<WorkInfoProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: _buildPopMenu(appLoc.languages),
        leadingWidth: 100,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSize.s16),
          child: SizedBox(
            width: double.infinity,
            child: Form(
              key: Provider.of<SignUpProvider>(context, listen: false).formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildImageProfile(),
                  const SizedBox(
                    height: AppSize.s20,
                  ),
                  //Personal Info
                  _buildHeaderAndBodyExpansion(
                      value: "Personal Info",
                      header: appLoc.personalInfo,
                      body: PersonalInfo()),
                  const SizedBox(
                    height: AppSize.s20,
                  ),
                  //work info
                  _buildHeaderAndBodyExpansion(
                      value: "Work Info",
                      header: appLoc.workInfo,
                      body: WorkInfo()),
                  const SizedBox(
                    height: AppSize.s20,
                  ),
                  //Medical info
                  _buildHeaderAndBodyExpansion(
                      value: "medical Info",
                      header: appLoc.medicalInfo,
                      body: const MedicalInfo()),
                  const SizedBox(
                    height: AppSize.s12,
                  ),
                  !signupProvider.loading
                      ? ElevatedButton(
                          onPressed: () {
                            if (Provider.of<SignUpProvider>(context,
                                    listen: false)
                                .formKey
                                .currentState!
                                .validate()) {
                              if (signupProvider.profileImage != null &&
                                  signupProvider.certificationImage != null &&
                                  signupProvider.licenceImage != null &&
                                  Provider.of<MedicalProvider>(context,
                                              listen: false)
                                          .video !=
                                      null) {
                                if (signupProvider.profileImageUrl != null &&
                                    Provider.of<MedicalProvider>(context,
                                                listen: false)
                                            .audioUrl !=
                                        null &&
                                    signupProvider.certificateImageUrl !=
                                        null &&
                                    signupProvider.licenseImageUrl != null &&
                                    Provider.of<MedicalProvider>(context,
                                                listen: false)
                                            .videoImageUrl !=
                                        null) {
                                  UserDataModel userModel = UserDataModel(
                                    password: personalProvider
                                        .passwordController.text,
                                    fullName: personalProvider
                                        .fullNameController.text,
                                    birthDate: personalProvider.date,
                                    certificatesUrl:
                                        signupProvider.certificateImageUrl,
                                    city: personalProvider.city,
                                    gender: personalProvider.gender,
                                    idType: personalProvider.idType,
                                    licenseUrl: signupProvider.licenseImageUrl,
                                    mainSpeciality: workProvider.mainSpec,
                                    mobile:
                                        "${personalProvider.countryCode}${personalProvider.mobileController.text}",
                                    personalAddress: personalProvider
                                        .personalAddressController.text,
                                    personalID:
                                        personalProvider.iDController.text,
                                    email:
                                        personalProvider.emailController.text,
                                    profileImageUrl:
                                        signupProvider.profileImageUrl,
                                    region: personalProvider.region,
                                    scientificDegree:
                                        workProvider.scientificDeg,
                                    subSpeciality: workProvider.subSpec,
                                    videoUrl: Provider.of<MedicalProvider>(
                                            context,
                                            listen: false)
                                        .videoImageUrl,
                                    voiceUrl: Provider.of<MedicalProvider>(
                                            context,
                                            listen: false)
                                        .audioUrl,
                                  );

                                  Provider.of<SignUpProvider>(context,
                                          listen: false)
                                      .signUp(
                                          email:
                                              personalProvider
                                                  .emailController.text,
                                          password: personalProvider
                                              .passwordController.text,
                                          context: context,
                                          userModel: userModel);
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        "wait for uploading your video then submit again",
                                      ),
                                    ),
                                  );
                                }
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      "please upload images and video",
                                    ),
                                  ),
                                );
                              }
                            }
                          },
                          child: Text(appLoc.signUp),
                        )
                      : const CircularProgressIndicator(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _buildPopMenu(String language) {
    return PopupMenuButton(
        icon: Column(
          children: [
            const Icon(Icons.settings, color: Colors.black, size: 20),
            Text(
              language,
              style: getRegularStyle(color: Colors.black),
            )
          ],
        ),
        onSelected: (value) {
          Provider.of<localeProvider>(context, listen: false)
              .changeLang(value.toString());
          Provider.of<localeProvider>(context, listen: false)
              .setLocale(Locale('$value'));
        },
        itemBuilder: (context) => [
              const PopupMenuItem(
                value: "en",
                child: Text("English"),
              ),
              const PopupMenuItem(
                value: "ar",
                child: Text("عربي"),
              ),
            ]);
  }

  _buildImageProfile() {
    return Stack(
      children: [
        CircleAvatar(
          // backgroundColor: ColorManager.white,
          radius: 55,
          child: ClipOval(
            child: Provider.of<SignUpProvider>(context).profileImage != null
                ? Image.file(
                    Provider.of<SignUpProvider>(context).profileImage!,
                    width: 110,
                    fit: BoxFit.cover,
                  )
                : Image.asset(ImageAssets.barChart,
                    // fit: BoxFit.cover,
                    width: 110),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: IconButton(
            onPressed: () {
              Provider.of<SignUpProvider>(context, listen: false)
                  .getPickedImage(typeOfImage: "profile");
            },
            icon: Icon(Icons.camera_alt, color: ColorManager.darkGreen),
          ),
        ),
      ],
    );
  }

  _buildHeaderAndBodyExpansion({String? value, header, Widget? body}) {
    return ExpansionPanelList.radio(
      children: [
        ExpansionPanelRadio(
            canTapOnHeader: true,
            // backgroundColor: ColorManager.darkGreen,
            value: value!,
            headerBuilder: (context, isExpanded) => Padding(
                  padding: const EdgeInsets.all(AppSize.s12),
                  child: Text(
                    header!,
                    // style: getSemiBoldStyle(color: ColorManager.white,
                    //     fontSize: AppSize.s18)
                  ),
                ),
            body: body!),
      ],
    );
  }
}
