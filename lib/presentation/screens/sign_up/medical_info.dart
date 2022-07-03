import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../../../logic/medical_provider.dart';
import '../../../logic/sign_up_provider.dart';
import '../../helper/audio.dart';
import '../../resources/color_manager.dart';
import '../../resources/styles_manager.dart';
import '../../resources/values_manager.dart';

class MedicalInfo extends StatefulWidget {
  const MedicalInfo({Key? key}) : super(key: key);

  @override
  State<MedicalInfo> createState() => _MedicalInfoState();
}

class _MedicalInfoState extends State<MedicalInfo> {
  TextEditingController diagnosisController = TextEditingController();

  TextEditingController operationController = TextEditingController();

  TextEditingController medicationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var appLoc = AppLocalizations.of(context)!;
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
                  Text(appLoc.pleaseAddDiagnosis),
                  IconButton(
                    icon: CircleAvatar(
                        backgroundColor: ColorManager.green,
                        child: Icon(
                          Icons.add,
                          color: ColorManager.white,
                        )),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: Text(appLoc.diagnosis),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(appLoc.pleaseAddDiagnosis),
                              const SizedBox(
                                height: AppSize.s4,
                              ),
                              TextField(
                                controller: diagnosisController,
                              ),
                              const SizedBox(
                                height: AppSize.s4,
                              ),
                              RaisedButton(
                                onPressed: () {
                                  setState(() {});
                                  Provider.of<MedicalProvider>(context,
                                          listen: false)
                                      .addToMedicalList(
                                          value: diagnosisController.text);
                                  Navigator.of(context).pop();
                                  diagnosisController.clear();
                                },
                                child: Text(
                                  "ok",
                                  style:
                                      getMediumStyle(color: ColorManager.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
          if (Provider.of<MedicalProvider>(context, listen: false)
              .diagnosis
              .isNotEmpty)
            const SizedBox(
              height: AppSize.s12,
            ),
          if (Provider.of<MedicalProvider>(context, listen: false)
              .diagnosis
              .isNotEmpty)
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
                          Provider.of<MedicalProvider>(context, listen: false)
                              .diagnosis[index],
                        ),
                      ),
                  separatorBuilder: (context, index) => SizedBox(
                        width: 20,
                      ),
                  itemCount:
                      Provider.of<MedicalProvider>(context, listen: false)
                          .diagnosis
                          .length),
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
                  Text(appLoc.pleaseAddPrevious),
                  IconButton(
                    icon: CircleAvatar(
                        backgroundColor: ColorManager.green,
                        child: Icon(
                          Icons.add,
                          color: ColorManager.white,
                        )),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          title:  Text(appLoc.operation),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(appLoc.pleaseAddPrevious),
                              const SizedBox(
                                height: AppSize.s4,
                              ),
                              TextField(
                                controller: operationController,
                              ),
                              const SizedBox(
                                height: AppSize.s4,
                              ),
                              RaisedButton(
                                onPressed: () {
                                  setState(() {});

                                  Provider.of<MedicalProvider>(context,
                                          listen: false)
                                      .addToMedicalList(
                                          status: "operations",
                                          value: operationController.text);

                                  Navigator.of(context).pop();
                                  operationController.clear();
                                },
                                child: Text(
                                  "ok",
                                  style:
                                      getMediumStyle(color: ColorManager.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: AppSize.s12,
          ),
          if (Provider.of<MedicalProvider>(context, listen: false)
              .operations
              .isNotEmpty)
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
                          Provider.of<MedicalProvider>(context, listen: false)
                              .operations[index],
                        ),
                      ),
                  separatorBuilder: (context, index) => SizedBox(
                        width: 20,
                      ),
                  itemCount:
                      Provider.of<MedicalProvider>(context, listen: false)
                          .operations
                          .length),
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
                  Text(appLoc.pleaseAddMedications),
                  IconButton(
                    icon: CircleAvatar(
                        backgroundColor: ColorManager.green,
                        child: Icon(
                          Icons.add,
                          color: ColorManager.white,
                        )),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          title:  Text(appLoc.medication),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(appLoc.pleaseAddMedications),
                              const SizedBox(
                                height: AppSize.s4,
                              ),
                              TextField(
                                controller: medicationController,
                              ),
                              const SizedBox(
                                height: AppSize.s4,
                              ),
                              RaisedButton(
                                onPressed: () {
                                  setState(() {});

                                  Provider.of<MedicalProvider>(context,
                                          listen: false)
                                      .addToMedicalList(
                                          status: "medications",
                                          value: medicationController.text);

                                  Navigator.of(context).pop();
                                  medicationController.clear();
                                },
                                child: Text(
                                  "ok",
                                  style:
                                      getMediumStyle(color: ColorManager.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: AppSize.s12,
          ),
          if (Provider.of<MedicalProvider>(context, listen: false)
              .medications
              .isNotEmpty)
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
                          Provider.of<MedicalProvider>(context, listen: false)
                              .medications[index],
                        ),
                      ),
                  separatorBuilder: (context, index) => SizedBox(
                        width: 20,
                      ),
                  itemCount:
                      Provider.of<MedicalProvider>(context, listen: false)
                          .medications
                          .length),
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
                  Expanded(child: Text(appLoc.describeByVideo)),
                  IconButton(
                    icon: Icon(
                      Icons.upload_outlined,
                    ),
                    onPressed: () {
                      Provider.of<MedicalProvider>(context, listen: false)
                          .getPickedVideo();
                    },
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
          if(Provider.of<MedicalProvider>(
              context,
              listen: false)
              .video!=null)
          const SizedBox(
            height: AppSize.s12,
          ),
          if(Provider.of<MedicalProvider>(
              context)
              .video!=null)
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: ColorManager.blueLightGreen
              ),
              child: Text(Uri.file(Provider.of<MedicalProvider>(
                context,)
                  .video!.path).pathSegments.last.toString(),style: Theme.of(context).textTheme.subtitle1),
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
                  Expanded(child: Text(appLoc.describeByVoice)),
                  IconButton(
                    icon: const Icon(
                      Icons.upload_outlined,
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => MyApp(),
                      ));
                    },
                  ),

                  Icon(
                    Icons.mic,
                    color: ColorManager.lightGreen,
                    size: 40,
                  )
                ],
              ),
            ),
          ),
          if(Provider.of<MedicalProvider>(
              context,
              listen: false)
              .audioFile!=null)
          const SizedBox(
            height: AppSize.s12,
          ),
          if(Provider.of<MedicalProvider>(
              context,
              listen: false)
              .audioFile!=null)
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: ColorManager.blueLightGreen
              ),
              child: Text(Uri.file(Provider.of<MedicalProvider>(
                  context,)
                  .audioFile!.path).pathSegments.last.toString(),style: Theme.of(context).textTheme.subtitle1),
            ),
          const SizedBox(
            height: AppSize.s12,
          ),
        ],
      ),
    );
  }
}
