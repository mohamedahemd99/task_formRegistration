import 'package:flutter/material.dart';
import 'strings_manager.dart';
import '../screens/main_view_screen.dart';
import '../screens/profile/profile_screen.dart';
import '../screens/settings_screen.dart';
import '../screens/sign_up/sign_up_screen.dart';

class Routes {
  static const String signUpRoute = '/';
  static const String mainRoute = '/main';
  static const String profileRoute = '/profile';
  static const String settingsRoute = '/settings';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.mainRoute:
        return MaterialPageRoute(
          builder: (context) => const MainViewScreen(),
        );
      case Routes.profileRoute:
        return MaterialPageRoute(
          builder: (context) => const ProfileScreen(),
        );
      case Routes.signUpRoute:
        return MaterialPageRoute(
          builder: (context) => SignUpScreen(),
        );
      case Routes.settingsRoute:
        return MaterialPageRoute(
          builder: (context) => const SettingsScreen(),
        );

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.noRouteFound),
        ),
        body: const Center(
          child: Text(AppStrings.noRouteFound),
        ),
      ),
    );
  }
}
