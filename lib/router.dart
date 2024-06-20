import 'package:flutter/material.dart';
import 'package:stacked_node/ui/views/signIn/signIn_screen.dart';
import 'package:stacked_node/ui/views/signUp/signUp_screen.dart';
import 'package:stacked_node/ui/views/splash/splash_screen.dart';
// Import other views as needed

class Routes {
  static const String splash = "/";
  static const String signUp = "/signUp";
  static const String signIn = "/signIn";
}

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.signUp:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case Routes.signIn:
        return MaterialPageRoute(builder: (_) => const SignInScreen());

      default:
        return MaterialPageRoute(
          builder: (_) =>  Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
