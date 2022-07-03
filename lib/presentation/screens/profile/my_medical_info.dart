import 'package:flutter/material.dart';
import '../../../logic/profile_provider.dart';
import '../../resources/color_manager.dart';
import '../../resources/styles_manager.dart';
import '../../resources/values_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class MyMedicalInfo extends StatefulWidget {
  MyMedicalInfo({Key? key, this.controller}) : super(key: key);
  VideoPlayerController? controller;

  @override
  State<MyMedicalInfo> createState() => _MyMedicalInfoState();
}

class _MyMedicalInfoState extends State<MyMedicalInfo> {
  @override
  Widget build(BuildContext context) {
    var appLoc = AppLocalizations.of(context)!;
    var profileProvider = Provider.of<ProfileProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(AppSize.s4),
      child: Column(
        children: [
          Card(
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSize.s8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(appLoc.pleaseAddDiagnosis,
                      style: Theme.of(context).textTheme.subtitle1),
                  Icon(
                    Icons.coronavirus,
                    color: ColorManager.lightGreen,
                    size: 40,
                  )
                ],
              ),
            ),
          ),
          if (profileProvider.diagnosis!.isNotEmpty)
            const SizedBox(
              height: AppSize.s12,
            ),
          if (profileProvider.diagnosis!.isNotEmpty)
            SizedBox(
              height: 50,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(AppSize.s20),
                            gradient: LinearGradient(colors: [
                              ColorManager.lightGreen,
                              ColorManager.green
                            ])),
                        padding: EdgeInsets.all(AppSize.s16),
                        child: Text(
                          profileProvider.diagnosis![index],
                        ),
                      ),
                  separatorBuilder: (context, index) => SizedBox(
                        width: 20,
                      ),
                  itemCount: profileProvider.diagnosis!.length),
            ),
          const SizedBox(
            height: AppSize.s12,
          ),
          Card(
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSize.s8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(appLoc.pleaseAddPrevious,
                      style: Theme.of(context).textTheme.subtitle1),
                  Icon(
                    Icons.open_in_full,
                    color: ColorManager.lightGreen,
                    size: 40,
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: AppSize.s12,
          ),
          if (profileProvider.operations!.isNotEmpty)
            SizedBox(
              height: 50,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(AppSize.s20),
                            gradient: LinearGradient(colors: [
                              ColorManager.lightGreen,
                              ColorManager.green
                            ])),
                        padding: EdgeInsets.all(AppSize.s16),
                        child: Text(
                          profileProvider.operations![index],
                        ),
                      ),
                  separatorBuilder: (context, index) => SizedBox(
                        width: 20,
                      ),
                  itemCount: profileProvider.operations!.length),
            ),
          const SizedBox(
            height: AppSize.s12,
          ),
          Card(
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSize.s8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(appLoc.pleaseAddMedications,
                      style: Theme.of(context).textTheme.subtitle1),
                  Icon(
                    Icons.medication,
                    color: ColorManager.lightGreen,
                    size: 40,
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: AppSize.s12,
          ),
          if (profileProvider.medications!.isNotEmpty)
            SizedBox(
              height: 50,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(AppSize.s20),
                            gradient: LinearGradient(colors: [
                              ColorManager.lightGreen,
                              ColorManager.green
                            ])),
                        padding: EdgeInsets.all(AppSize.s16),
                        child: Text(
                          profileProvider.medications![index],
                        ),
                      ),
                  separatorBuilder: (context, index) => SizedBox(
                        width: 20,
                      ),
                  itemCount: profileProvider.medications!.length),
            ),
          const SizedBox(
            height: AppSize.s12,
          ),
          Card(
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSize.s8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(appLoc.describeByVideo,
                      style: Theme.of(context).textTheme.subtitle1),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        widget.controller!.value.isPlaying
                            ? widget.controller!.pause()
                            : widget.controller!.play();
                      });
                    },
                    icon: Icon(
                      widget.controller!.value.isPlaying
                          ? Icons.pause
                          : Icons.play_arrow,
                    ),
                  ),
                  Icon(
                    Icons.videocam_sharp,
                    color: ColorManager.lightGreen,
                    size: 40,
                  )
                ],
              ),
            ),
          ),
          Center(
            child: widget.controller!.value.isInitialized
                ? SizedBox(
                    height: 200,
                    width: double.infinity,
                    child: AspectRatio(
                      aspectRatio: widget.controller!.value.aspectRatio,
                      child: VideoPlayer(widget.controller!),
                    ),
                  )
                : Container(),
          ),
          if (profileProvider.userModel!.voiceUrl != null)

            ///voice///
            Column(
              children: [
                const SizedBox(
                  height: AppSize.s12,
                ),
                Card(
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: AppSize.s8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(appLoc.describeByVoice,
                            style: Theme.of(context).textTheme.subtitle1),
                        Icon(
                          Icons.mic,
                          color: ColorManager.lightGreen,
                          size: 40,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: AppSize.s12,
                ),
                InkWell(
                  onTap: () {
                    profileProvider.toggle(profileProvider.userModel!.voiceUrl);
                    profileProvider.changePlayerValue();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: ColorManager.blueLightGreen),
                        child: Text("your voice",
                            style: getMediumStyle(color: ColorManager.white,fontSize: AppSize.s14)),
                      ),
                      Icon(profileProvider.isPlaying
                          ? Icons.pause
                          : Icons.play_arrow)
                    ],
                  ),
                ),
                Slider(
                    min: 0,
                    max: profileProvider.duration.inSeconds.toDouble(),
                    value: profileProvider.position.inSeconds.toDouble(),
                    onChanged: (value) async {
                      final position = Duration(seconds: value.toInt());
                      await profileProvider.player.seek(position);
                      await profileProvider.player.resume();
                    }),
                Padding(
                  padding: EdgeInsets.all(AppSize.s12),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(profileProvider.position.inSeconds.toString()),
                        Text((profileProvider.duration.inSeconds -
                                profileProvider.position.inSeconds)
                            .toString()),
                      ]),
                ),
              ],
            )
        ],
      ),
    );
  }
}
