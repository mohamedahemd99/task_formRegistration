import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../logic/home_provider.dart';
import '../../logic/profile_provider.dart';
import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/const.dart';
import '../resources/routes_manager.dart';
import '../resources/styles_manager.dart';
import '../resources/values_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'card_item.dart';

class MainViewScreen extends StatefulWidget {
  const MainViewScreen({Key? key}) : super(key: key);

  @override
  State<MainViewScreen> createState() => _MainViewScreenState();
}

class _MainViewScreenState extends State<MainViewScreen> {
  @override
  void initState() {
    Provider.of<ProfileProvider>(context, listen: false).getClinicsData();
    Provider.of<ProfileProvider>(context, listen: false).getUserData();
    Provider.of<ProfileProvider>(context, listen: false).getDiagnosisData();
    Provider.of<ProfileProvider>(context, listen: false).getOperationData();
    Provider.of<ProfileProvider>(context, listen: false).getMedicationData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 330,
                    child: Stack(
                      children: [
                        SizedBox(
                          height: 330,
                          width: double.infinity,
                          child: QuarterCircle(
                            color: ColorManager.blueDarkGreen,
                            circleAlignment: CircleAlignment.topLeft,
                          ),
                        ),
                        SizedBox(
                          height: 300,
                          width: double.infinity,
                          child: QuarterCircle(
                            color: ColorManager.blueLightGreen,
                            circleAlignment: CircleAlignment.topLeft,
                          ),
                        ),
                        Positioned(
                          left: 20,
                          bottom: 80,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(AppLocalizations.of(context)!.home,
                                  style: getBoldStyle(
                                      color: ColorManager.white,
                                      fontSize: AppSize.s40)),
                              const SizedBox(
                                width: AppSize.s12,
                              ),
                              Image.asset(ImageAssets.umbrella),
                            ],
                          ),
                        ),
                        Positioned(
                          right: 20,
                          bottom: 80,
                          child: Provider.of<ProfileProvider>(context,
                                          listen: false)
                                      .userModel !=
                                  null
                              ? Column(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor:
                                          ColorManager.blueLightGreen,
                                      radius: 28,
                                      child: CircleAvatar(
                                        radius: 25,
                                        backgroundColor:
                                            ColorManager.blueLightGreen,
                                        child: ClipOval(
                                          child: Provider.of<ProfileProvider>(
                                                              context,
                                                              listen: false)
                                                          .userModel !=
                                                      null &&
                                                  Provider.of<ProfileProvider>(
                                                              context,
                                                              listen: false)
                                                          .userModel!
                                                          .profileImageUrl !=
                                                      null
                                              ? CachedNetworkImage(
                                                  errorWidget:
                                                      (context, url, error) =>
                                                          const Icon(
                                                    Icons.error,
                                                    size: 60,
                                                  ),
                                                  imageUrl: Provider.of<
                                                      ProfileProvider>(
                                                    context,
                                                  ).userModel!.profileImageUrl!,
                                                  fit: BoxFit.cover,
                                                  width: 50,
                                                )
                                              : Image.asset(
                                                  ImageAssets.barChart,
                                                  // fit: BoxFit.cover,
                                                  width: 110),
                                        ),
                                      ),
                                    ),
                                    Text(Provider.of<ProfileProvider>(context)
                                        .userModel!
                                        .fullName!)
                                  ],
                                )
                              : const CircularProgressIndicator(),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: AppSize.s20),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: Provider.of<HomeProvider>(context).grid.length,
                      itemBuilder: (context, index) => CardItem(index: index),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 9 / 7,
                              crossAxisSpacing: 8,
                              crossAxisCount: 2,
                              mainAxisSpacing: 8),
                    ),
                  ),
                  const SizedBox(
                    height: AppSize.s20,
                  )
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: ColorManager.blueLightGreen,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                    onTap: () {},
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(12)),
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            Icon(
                              Icons.home,
                              color: ColorManager.white,
                              size: 30,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              AppLocalizations.of(context)!.home,
                              style:
                                  getSemiBoldStyle(color: ColorManager.white),
                            )
                          ],
                        ))),
                InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(Routes.settingsRoute);
                    },
                    child: Column(
                      children: [
                        Icon(
                          Icons.settings,
                          color: ColorManager.white,
                          size: 30,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          AppLocalizations.of(context)!.settings,
                          style: getSemiBoldStyle(color: ColorManager.white),
                        )
                      ],
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
