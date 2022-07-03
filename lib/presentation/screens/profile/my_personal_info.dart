import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../../logic/profile_provider.dart';

import '../../resources/values_manager.dart';

class MyPersonalInfo extends StatelessWidget {
  const MyPersonalInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var appLoc = AppLocalizations.of(context)!;
    var provider = Provider.of<ProfileProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(AppSize.s12),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(appLoc.fullName,
                  style: Theme.of(context).textTheme.headline1),
              Text(provider.userModel!.fullName!,
                  style: Theme.of(context).textTheme.subtitle1)
            ],
          ),
          const SizedBox(
            height: AppSize.s12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(appLoc.yourId,
                    style: Theme.of(context).textTheme.headline1),
              ),
              Text(provider.userModel!.idType!,
                  style: Theme.of(context).textTheme.subtitle1),
              const SizedBox(
                width: AppSize.s16,
              ),
              Text(provider.userModel!.personalID!,
                  style: Theme.of(context).textTheme.subtitle1),
            ],
          ),
          const SizedBox(
            height: AppSize.s12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(appLoc.dateOfBirth,
                  style: Theme.of(context).textTheme.headline1),
              Text(provider.userModel!.birthDate!,
                  style: Theme.of(context).textTheme.subtitle1)
            ],
          ),
          const SizedBox(
            height: AppSize.s12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(appLoc.personalAddress,
                  style: Theme.of(context).textTheme.headline1),
              Text(provider.userModel!.personalAddress!,
                  style: Theme.of(context).textTheme.subtitle1)
            ],
          ),
          const SizedBox(
            height: AppSize.s12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(appLoc.city, style: Theme.of(context).textTheme.headline1),
              Text(provider.userModel!.city!,
                  style: Theme.of(context).textTheme.subtitle1)
            ],
          ),
          const SizedBox(
            height: AppSize.s12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(appLoc.region, style: Theme.of(context).textTheme.headline1),
              Text(provider.userModel!.region!,
                  style: Theme.of(context).textTheme.subtitle1)
            ],
          ),
          const SizedBox(
            height: AppSize.s12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(appLoc.mobile, style: Theme.of(context).textTheme.headline1),
              Text(provider.userModel!.mobile!,
                  style: Theme.of(context).textTheme.subtitle1)
            ],
          ),
          const SizedBox(
            height: AppSize.s12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(appLoc.email, style: Theme.of(context).textTheme.headline1),
              Text(provider.userModel!.email!,
                  style: Theme.of(context).textTheme.subtitle1)
            ],
          ),
          const SizedBox(
            height: AppSize.s12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(appLoc.password,
                  style: Theme.of(context).textTheme.headline1),
              Text(provider.userModel!.password!,
                  style: Theme.of(context).textTheme.subtitle1)
            ],
          ),
        ],
      ),
    );
  }
}
