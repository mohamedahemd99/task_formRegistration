import 'package:country_code_picker/country_code_picker.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../../../logic/sign_up_provider.dart';
import '../../../logic/work_info_provider.dart';
import '../../../model/clinic_model.dart';
import '../../helper/app_validator.dart';
import '../../resources/color_manager.dart';
import '../../resources/const.dart';
import '../../resources/values_manager.dart';

class WorkInfo extends StatelessWidget {
  WorkInfo({Key? key}) : super(key: key);

  final GlobalKey<FormState> _workFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var appLoc = AppLocalizations.of(context)!;
    var provider = Provider.of<WorkInfoProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(AppSize.s12),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: Text(appLoc.mainSpeciality)),
              // const SizedBox(
              //   width: AppSize.s8,
              // ),
              Expanded(
                flex: 2,
                child: DropdownButtonFormField<String>(
                    validator: (value) {
                      if (value ==
                          Provider.of<WorkInfoProvider>(context, listen: false)
                              .mainSpecialist[0]) {
                        return appLoc.pleaseCompleteTheData;
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey))),
                    value: provider.mainSpecialist[0],
                    isExpanded: true,
                    items: provider.mainSpecialist
                        .map(
                          (e) => DropdownMenuItem(
                            value: e,
                            child: Text(e),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      provider.changeMainSpecialist(value);
                    }),
              ),
            ],
          ),
          const SizedBox(
            height: AppSize.s12,
          ),
          Row(
            children: [
              Expanded(child: Text(appLoc.subSpeciality)),
              // const SizedBox(
              //   width: AppSize.s8,
              // ),
              Expanded(
                flex: 2,
                child: DropdownButtonFormField<String>(
                    validator: (value) {
                      if (value ==
                          Provider.of<WorkInfoProvider>(context, listen: false)
                              .subSpecialist[0]) {
                        return appLoc.pleaseCompleteTheData;
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey))),
                    value: provider.subSpecialist[0],
                    isExpanded: true,
                    items: provider.subSpecialist
                        .map(
                          (e) => DropdownMenuItem(
                            value: e,
                            child: Text(e),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      provider.changeSubSpecialist(value);

                    }),
              ),
            ],
          ),
          const SizedBox(
            height: AppSize.s12,
          ),
          Row(
            children: [
              Expanded(child: Text(appLoc.scientificDegree)),
              // const SizedBox(
              //   width: AppSize.s8,
              // ),
              Expanded(
                flex: 2,
                child: DropdownButtonFormField<String>(
                    validator: (value) {
                      if (value ==
                          Provider.of<WorkInfoProvider>(context, listen: false)
                              .scientificDegree[0]) {
                        return appLoc.pleaseCompleteTheData;
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey))),
                    value: provider.scientificDegree[0],
                    isExpanded: true,
                    items: provider.scientificDegree
                        .map(
                          (e) => DropdownMenuItem(
                            value: e,
                            child: Text(e),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      provider.changeDegree(value);

                    }),
              ),
            ],
          ),
          const SizedBox(
            height: AppSize.s12,
          ),
          Form(
            key: _workFormKey,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(child: Text(appLoc.clinicName)),
                    // const SizedBox(
                    //   width: AppSize.s8,
                    // ),
                    Expanded(
                      flex: 2,
                      child: buildTextFormField(context, appLoc.clinicName,
                          provider.clinicNameController,
                          inputType: TextInputType.emailAddress),
                    ),
                  ],
                ),
                const SizedBox(
                  height: AppSize.s12,
                ),
                Row(
                  children: [
                    Expanded(child: Text(appLoc.clinicAddress)),
                    // const SizedBox(
                    //   width: AppSize.s8,
                    // ),
                    Expanded(
                      flex: 2,
                      child: buildTextFormField(context, appLoc.clinicAddress,
                          provider.clinicAddressController,
                          inputType: TextInputType.emailAddress),
                    ),
                  ],
                ),
                const SizedBox(
                  height: AppSize.s12,
                ),
                Row(
                  children: [
                    Expanded(child: Text(appLoc.clinicPhone)),
                    // const SizedBox(
                    //   width: AppSize.s8,
                    // ),
                    Expanded(
                      flex: 2,
                      child: buildTextFormField(context, appLoc.clinicPhone,
                          provider.clinicPhoneController,
                          inputType: TextInputType.phone),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: IconButton(
              icon: CircleAvatar(
                  backgroundColor: ColorManager.green,
                  child: Icon(
                    Icons.add,
                    color: ColorManager.white,
                  )),
              onPressed: () {
                if (_workFormKey.currentState!.validate()) {
                  Clinic clinic = Clinic(
                      clinicAddress: provider.clinicAddressController.text,
                      clinicName: provider.clinicNameController.text,
                      clinicPhone: provider.clinicPhoneController.text);
                  Provider.of<WorkInfoProvider>(context, listen: false)
                      .addToClinicList(value: clinic);

                  provider.clinicPhoneController.clear();
                  provider.clinicNameController.clear();
                  provider.clinicAddressController.clear();
                }
              },
            ),
          ),
          if (Provider.of<WorkInfoProvider>(context, listen: false)
              .clinics
              .isNotEmpty)
            const SizedBox(
              height: AppSize.s12,
            ),
          if (Provider.of<WorkInfoProvider>(context, listen: false)
              .clinics
              .isNotEmpty)
            ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) => Card(
                      child: Padding(
                        padding: EdgeInsets.all(AppSize.s16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("${appLoc.clinicName}:"),
                                Text(Provider.of<WorkInfoProvider>(context,
                                        listen: false)
                                    .clinics[index]
                                    .clinicName!),
                              ],
                            ),
                            const SizedBox(
                              height: AppSize.s12,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("${appLoc.clinicAddress}:"),
                                Text(Provider.of<WorkInfoProvider>(context,
                                        listen: false)
                                    .clinics[index]
                                    .clinicAddress!),
                              ],
                            ),
                            const SizedBox(
                              height: AppSize.s12,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("${appLoc.clinicPhone}:"),
                                Text(Provider.of<WorkInfoProvider>(context,
                                        listen: false)
                                    .clinics[index]
                                    .clinicPhone!),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                separatorBuilder: (context, index) => const SizedBox(
                      width: AppSize.s20,
                    ),
                itemCount: Provider.of<WorkInfoProvider>(context, listen: false)
                    .clinics
                    .length),
          const SizedBox(
            height: AppSize.s12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(appLoc.uploadCertificates),
                  // const SizedBox(
                  //   width: AppSize.s8,
                  // ),
                  IconButton(
                      onPressed: () {
                        Provider.of<SignUpProvider>(context, listen: false)
                            .getPickedImage(typeOfImage: "certification");
                      },
                      icon: const Icon(Icons.upload_outlined)),
                ],
              ),
              Text(appLoc.uploadAPhoto),
            ],
          ),
          if(Provider.of<SignUpProvider>(
              context,
              listen: false)
              .certificationImage!=null)
            const SizedBox(
              height: AppSize.s12,
            ),
          if(Provider.of<SignUpProvider>(
              context,
              listen: false)
              .certificationImage!=null)
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: ColorManager.blueLightGreen
              ),
              child: Text(Uri.file(Provider.of<SignUpProvider>(
                context,)
                  .certificationImage!.path).pathSegments.last.toString(),style: Theme.of(context).textTheme.subtitle1),
            ),
          const SizedBox(
            height: AppSize.s12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(appLoc.uploadLicense),
                  // const SizedBox(
                  //   width: AppSize.s8,
                  // ),

                  IconButton(
                      onPressed: () {
                        Provider.of<SignUpProvider>(context, listen: false)
                            .getPickedImage(typeOfImage: "license");
                      },
                      icon: const Icon(Icons.upload_outlined)),
                ],
              ),
              Text(appLoc.uploadAPhoto),
            ],
          ),
          if(Provider.of<SignUpProvider>(
              context,
              listen: false)
              .licenceImage!=null)
            const SizedBox(
              height: AppSize.s12,
            ),
          if(Provider.of<SignUpProvider>(
              context,
              listen: false)
              .licenceImage!=null)
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: ColorManager.blueLightGreen
              ),
              child: Text(Uri.file(Provider.of<SignUpProvider>(
                context,)
                  .licenceImage!.path).pathSegments.last.toString(),style: Theme.of(context).textTheme.subtitle1),
            ),
        ],
      ),
    );
  }
}
