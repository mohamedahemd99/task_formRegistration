import 'package:country_code_picker/country_code_picker.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../../../logic/personal_info_provider.dart';
import '../../../logic/sign_up_provider.dart';
import '../../resources/const.dart';
import '../../resources/values_manager.dart';

class PersonalInfo extends StatelessWidget {
  PersonalInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var appLoc = AppLocalizations.of(context)!;
    var provider = Provider.of<PersonalInfoProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(AppSize.s12),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: Text(appLoc.fullName)),
              Expanded(
                flex: 2,
                child: buildTextFormField(
                    context, appLoc.fullName, provider.fullNameController),
              ),
            ],
          ),
          const SizedBox(
            height: AppSize.s12,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: Text(appLoc.yourId)),
              Expanded(
                child: DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.grey)),
                        focusedBorder: const OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.grey))),
                    value: appLoc.passport,
                    isExpanded: true,
                    items: [
                      DropdownMenuItem(
                        value: appLoc.passport,
                        child: Text(appLoc.passport),
                      ),
                      DropdownMenuItem(
                        value: appLoc.nationalID,
                        child: Text(appLoc.nationalID),
                      ),
                    ],
                    onChanged: (value) {
                      provider.changeIDType(value);
                    }),
              ),
              const SizedBox(
                width: AppSize.s8,
              ),
              Expanded(
                  child: buildTextFormField(
                      context, appLoc.yourId, provider.iDController,
                      inputType: TextInputType.number)),
            ],
          ),
          const SizedBox(
            height: AppSize.s12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: Text(appLoc.gender)),
              Row(
                children: [
                  Checkbox(
                    value: provider.female,
                    onChanged: (value) {
                      Provider.of<PersonalInfoProvider>(context, listen: false)
                          .checkFemale(value!);

                    },
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  ),
                  Icon(
                    Icons.female_outlined,
                    color: Colors.pink[300],
                  ),
                  Text(appLoc.female)
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: provider.isMale,
                    onChanged: (value) {
                      Provider.of<PersonalInfoProvider>(context, listen: false)
                          .checkMale(value!);
                    },
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  ),
                  Icon(
                    Icons.male_outlined,
                    color: Colors.blue[300],
                  ),
                  Text(appLoc.male)
                ],
              ),
            ],
          ),
          const SizedBox(
            height: AppSize.s12,
          ),
          Row(
            children: [
              Expanded(child: Text(appLoc.dateOfBirth)),
              Expanded(
                  flex: 2,
                  child: DateTimePicker(
                    initialValue: '',
                    firstDate: DateTime(1950),
                    lastDate: DateTime(2023),
                    dateLabelText: 'Date',
                    onChanged: (val) => provider.changeDate(val),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return appLoc.pleaseCompleteTheData;
                      }
                    },
                    onSaved: (val) => print(val),
                  ))
            ],
          ),
          const SizedBox(
            height: AppSize.s12,
          ),
          Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Text(
                    appLoc.personalAddress,
                    overflow: TextOverflow.ellipsis,
                  )),
              Expanded(
                flex: 2,
                child: buildTextFormField(context, appLoc.personalAddress,
                    provider.personalAddressController,
                    inputType: TextInputType.text),
              ),
            ],
          ),
          const SizedBox(
            height: AppSize.s12,
          ),
          Row(
            children: [
              Expanded(child: Text(appLoc.city)),
              Expanded(
                flex: 2,
                child: DropdownButtonFormField<String>(
                    validator: (value) {
                      if (value ==
                          Provider.of<PersonalInfoProvider>(context,
                                  listen: false)
                              .cities[0]) {
                        return appLoc.pleaseCompleteTheData;
                      }
                      return null;
                    },
                    value: provider.cities[0],
                    isExpanded: true,
                    items: provider.cities
                        .map(
                          (e) => DropdownMenuItem(
                            value: e,
                            child: Text(e),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      provider.changeCity(value);
                    }),
              ),
            ],
          ),
          const SizedBox(
            height: AppSize.s12,
          ),
          Row(
            children: [
              Expanded(child: Text(appLoc.region)),
              Expanded(
                flex: 2,
                child: DropdownButtonFormField<String>(
                    validator: (value) {
                      if (value ==
                          Provider.of<PersonalInfoProvider>(context,
                                  listen: false)
                              .regions[0]) {
                        return appLoc.pleaseCompleteTheData;
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey))),
                    value: provider.regions[0],
                    isExpanded: true,
                    items: provider.regions
                        .map(
                          (e) => DropdownMenuItem(
                            value: e,
                            child: Text(e),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      provider.changeRegion(value);
                    }),
              ),
            ],
          ),
          const SizedBox(
            height: AppSize.s12,
          ),
          Row(
            children: [
              Expanded(child: Text(appLoc.mobile)),
              Expanded(
                flex: 2,
                child: Row(
                  children: [
                    CountryCodePicker(
                      showFlag: false,
                      onChanged: (value) {

                        provider.changeCountryCode(value.dialCode.toString());
                      },
                      initialSelection: 'eg',
                      showCountryOnly: false,
                      showOnlyCountryWhenClosed: false,
                    ),
                    Expanded(
                        child: buildTextFormField(
                            context, appLoc.mobile, provider.mobileController,
                            inputType: TextInputType.phone))
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: AppSize.s12,
          ),
          Row(
            children: [
              Expanded(child: Text(appLoc.email)),
              Expanded(
                flex: 2,
                child: buildTextFormField(
                    context, appLoc.email, provider.emailController,
                    inputType: TextInputType.emailAddress),
              ),
            ],
          ),
          const SizedBox(
            height: AppSize.s12,
          ),
          Row(
            children: [
              Expanded(child: Text(appLoc.password)),
              Expanded(
                flex: 2,
                child: buildTextFormField(
                    context, appLoc.password, provider.passwordController,
                    isPassword: true, inputType: TextInputType.emailAddress),
              ),
            ],
          ),
          const SizedBox(
            height: AppSize.s12,
          ),
          Row(
            children: [
              Expanded(child: Text(appLoc.confirmPassword)),
              Expanded(
                flex: 2,
                child: buildTextFormField(context, appLoc.confirmPassword,
                    provider.confirmPasswordController,
                    isConfirmedPassword: true,
                    confirmedPassword: provider.passwordController,
                    isPassword: true,
                    inputType: TextInputType.emailAddress),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
