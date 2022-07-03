import 'package:flutter/material.dart';
import '../../../logic/profile_provider.dart';
import '../../resources/color_manager.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../resources/values_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class MyWorkInfo extends StatelessWidget {
  const MyWorkInfo({Key? key}) : super(key: key);

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
              Text(
                appLoc.mainSpeciality,
                style: Theme.of(context).textTheme.headline1,
              ),
              Text(provider.userModel!.mainSpeciality!),
            ],
          ),
          const SizedBox(
            height: AppSize.s12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(appLoc.subSpeciality,
                  style: Theme.of(context).textTheme.headline1),
              Text(provider.userModel!.subSpeciality!),
            ],
          ),
          const SizedBox(
            height: AppSize.s12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(appLoc.scientificDegree,
                  style: Theme.of(context).textTheme.headline1),
              Text(provider.userModel!.scientificDegree!),
            ],
          ),
          const SizedBox(
            height: AppSize.s12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(appLoc.clinics, style: Theme.of(context).textTheme.headline1),
              Icon(
                Icons.place,
                color: ColorManager.darkGreen,
              )
            ],
          ),
          const SizedBox(
            height: AppSize.s12,
          ),
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
                              Text("${appLoc.clinicName}:",
                                  style: Theme.of(context).textTheme.subtitle1),
                              Text(provider.clinics![index].clinicName!),
                            ],
                          ),
                          const SizedBox(
                            height: AppSize.s12,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("${appLoc.clinicAddress}:",
                                  style: Theme.of(context).textTheme.subtitle1),
                              Text(provider.clinics![index].clinicAddress!),
                            ],
                          ),
                          const SizedBox(
                            height: AppSize.s12,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("${appLoc.clinicPhone}:",
                                  style: Theme.of(context).textTheme.subtitle1),
                              Text(provider.clinics![index].clinicPhone!),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
              separatorBuilder: (context, index) => const SizedBox(
                    width: AppSize.s20,
                  ),
              itemCount: provider.clinics!.length),
          const SizedBox(
            height: AppSize.s12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(appLoc.certificates,
                  style: Theme.of(context).textTheme.headline1),
              Icon(
                Icons.image,
                color: ColorManager.darkGreen,
              )
            ],
          ),
          const SizedBox(
            height: AppSize.s12,
          ),
          provider.userModel!.certificatesUrl != null
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    height: 250,
                    width: double.infinity,
                    color: Colors.white,
                    child: CachedNetworkImage(
                      errorWidget: (context, url, error) => Icon(
                        Icons.error,
                        size: 60,
                      ),
                      imageUrl: provider.userModel!.certificatesUrl!,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              : Center(child: Text(appLoc.thereIsNo+appLoc.certificates,
              style: Theme.of(context).textTheme.subtitle1)),
          const SizedBox(
            height: AppSize.s12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(appLoc.license,
                  style: Theme.of(context).textTheme.headline1),
              Icon(
                Icons.image,
                color: ColorManager.darkGreen,
              )
            ],
          ),
          const SizedBox(
            height: AppSize.s12,
          ),
          provider.userModel!.licenseUrl != null
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    height: 250,
                    width: double.infinity,
                    color: Colors.white,
                    child: CachedNetworkImage(
                      errorWidget: (context, url, error) => Icon(
                        Icons.error,
                        size: 60,
                      ),
                      imageUrl: provider.userModel!.licenseUrl!,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              : Center(child: Text(appLoc.thereIsNo+appLoc.license)),
        ],
      ),
    );
  }
}
