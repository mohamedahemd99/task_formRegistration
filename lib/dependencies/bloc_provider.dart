import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../logic/home_provider.dart';
import '../logic/lang_provider.dart';
import '../logic/medical_provider.dart';
import '../logic/personal_info_provider.dart';
import '../logic/profile_provider.dart';
import '../logic/sign_up_provider.dart';
import '../logic/work_info_provider.dart';

class AppMainProvider extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const AppMainProvider({this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => localeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PersonalInfoProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => MedicalProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => WorkInfoProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProfileProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => HomeProvider(),
        ),
        ChangeNotifierProvider<SignUpProvider>(
          create: (context) => SignUpProvider(),
        ),
      ],
      child: child!,
    );
  }
}
