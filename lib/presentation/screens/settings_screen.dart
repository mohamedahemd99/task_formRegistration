import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../logic/lang_provider.dart';
import '../resources/color_manager.dart';
import '../resources/routes_manager.dart';
import '../resources/styles_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../resources/values_manager.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var appLoc = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(appLoc.settings),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        leadingWidth: 110,
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Row(
            children: [const Icon(Icons.arrow_back_ios), Text(appLoc.back)],
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(AppSize.s16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        appLoc.darkMode,
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      CupertinoSwitch(
                        activeColor: ColorManager.darkGreen,
                        value: Provider.of<localeProvider>(context).darkTheme,
                        onChanged: (value) {
                          Provider.of<localeProvider>(context, listen: false)
                              .themeModeChange(
                                  value ? ThemeMode.dark : ThemeMode.light);
                          Provider.of<localeProvider>(context, listen: false)
                              .changeTheme(value);
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: AppSize.s20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(appLoc.languages,
                          style: Theme.of(context).textTheme.subtitle1),
                      SizedBox(
                        width: AppSize.s12,
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: ColorManager.grey1)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  Provider.of<localeProvider>(context,
                                          listen: false)
                                      .changeLang("en");
                                  Provider.of<localeProvider>(context,
                                          listen: false)
                                      .setLocale(Locale('en'));
                                },
                                child: Text("English",
                                    style:
                                        Theme.of(context).textTheme.subtitle1),
                              ),
                              Divider(
                                color: ColorManager.grey1,
                                thickness: 1,
                              ),
                              InkWell(
                                  onTap: () {
                                    Provider.of<localeProvider>(context,
                                            listen: false)
                                        .changeLang("ar");
                                    Provider.of<localeProvider>(context,
                                            listen: false)
                                        .setLocale(Locale('ar'));
                                  },
                                  child: Text("عربي",
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle1)),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: AppSize.s20,
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.of(context).pushNamed(Routes.profileRoute);
                    },
                    iconColor: ColorManager.white,
                    textColor: ColorManager.white,
                    tileColor: ColorManager.darkGreen,
                    leading: Icon(Icons.person),
                    title: Text(appLoc.profile),
                    trailing: Icon(Icons.arrow_forward_ios),
                  )
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: ColorManager.darkGreen,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: const Radius.circular(15))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
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
                          appLoc.home,
                          style: getSemiBoldStyle(color: ColorManager.white),
                        )
                      ],
                    )),
                InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(Routes.settingsRoute);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(12)),
                      padding: const EdgeInsets.all(16),
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
                            appLoc.settings,
                            style: getSemiBoldStyle(color: ColorManager.white),
                          )
                        ],
                      ),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
