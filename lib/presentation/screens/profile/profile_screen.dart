import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../logic/profile_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../resources/assets_manager.dart';
import '../../resources/values_manager.dart';
import 'my_medical_info.dart';
import 'my_work_info.dart';
import 'package:video_player/video_player.dart';
import 'my_personal_info.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  VideoPlayerController? controller;

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.network(
        Provider.of<ProfileProvider>(context, listen: false)
            .userModel!
            .videoUrl!)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
Provider.of<ProfileProvider>(context,listen: false).init();


  }
  @override
  void dispose() {
    super.dispose();
    controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var profileProvider = Provider.of<ProfileProvider>(context);
    var appLoc = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(appLoc.profile),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSize.s16),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  // backgroundColor: ColorManager.white,
                  radius: 55,
                  child: ClipOval(
                    child: profileProvider.userModel!.profileImageUrl != null
                        ? Image.network(
                            profileProvider.userModel!.profileImageUrl!,
                            width: 110,
                            fit: BoxFit.cover,
                          )
                        : Image.asset(ImageAssets.barChart,
                            // fit: BoxFit.cover,
                            width: 110),
                  ),
                ),
                const SizedBox(
                  height: AppSize.s20,
                ),
                ExpansionPanelList.radio(
                  children: [
                    ExpansionPanelRadio(
                        canTapOnHeader: true,

                        // backgroundColor: ColorManager.darkGreen,
                        value: "Personal Info",
                        headerBuilder: (context, isExpanded) => Padding(
                              padding: const EdgeInsets.all(AppSize.s12),
                              child: Text(
                                appLoc.personalInfo,
                                // style: getSemiBoldStyle(color: ColorManager.white,
                                //     fontSize: AppSize.s18)
                              ),
                            ),
                        body: const MyPersonalInfo()),
                  ],
                ),
                const SizedBox(
                  height: AppSize.s20,
                ),
                ExpansionPanelList.radio(
                  children: [
                    ExpansionPanelRadio(
                        // backgroundColor: ColorManager.darkGreen,
                        value: "Work Info",
                        canTapOnHeader: true,
                        headerBuilder: (context, isExpanded) => Padding(
                              padding: const EdgeInsets.all(AppSize.s12),
                              child: Text(
                                appLoc.workInfo,
                                // style: getSemiBoldStyle(color: ColorManager.white,
                                //     fontSize: AppSize.s18)
                              ),
                            ),
                        body: const MyWorkInfo()),
                  ],
                ),
                const SizedBox(
                  height: AppSize.s20,
                ),
                ExpansionPanelList.radio(
                  children: [
                    ExpansionPanelRadio(
                        // backgroundColor: ColorManager.darkGreen,
                        value: "medical Info",
                        canTapOnHeader: true,
                        headerBuilder: (context, isExpanded) => Padding(
                              padding: const EdgeInsets.all(AppSize.s12),
                              child: Text(
                                appLoc.medicalInfo,
                                // style: getSemiBoldStyle(color: ColorManager.white,
                                //     fontSize: AppSize.s18)
                              ),
                            ),
                        body:  MyMedicalInfo(controller: controller,)),
                  ],
                ),
                const SizedBox(
                  height: AppSize.s12,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
