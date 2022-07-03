import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'dependencies/bloc_provider.dart';
import 'l10n/l10n.dart';
import 'presentation/resources/routes_manager.dart';
import 'presentation/resources/theme_manager.dart';
import 'package:firebase_core/firebase_core.dart';
import 'logic/lang_provider.dart';
import 'local/cache_helper.dart';

void main() async {
  // inialize object before calling [runApp].
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await CacheHelper.init(); //localStorage

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AppMainProvider(
        child: ChangeNotifierProvider(
            create: (context) => localeProvider()..getThemeMode(),
            builder: (context, child) {
              final provider = Provider.of<localeProvider>(context);
              return MaterialApp(
                supportedLocales: L10n.all,
                locale: provider.locale,
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                debugShowCheckedModeBanner: false,
                themeMode: provider.tm,
                darkTheme: getAppDarkTheme(),
                theme: getAppLightTheme(),
                onGenerateRoute: RouteGenerator.getRoute,
                initialRoute: CacheHelper.getData(key: 'uid') == null
                    ? Routes.signUpRoute
                    : Routes.mainRoute,
              );
            }));
  }
}
