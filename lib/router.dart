import 'package:flutter/material.dart';
import 'package:stacked_node/ui/views/home/home_page.dart';
import 'package:stacked_node/ui/views/signUp/signUp_page.dart';
import 'package:stacked_node/ui/views/splash/splash_page.dart';
// Import other views as needed



class Routes {
  static const String splash = "/";
  static const String home = "/home";
  static const String signUp = "/signUp";
}

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (_) => SplashPage());
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case Routes.signUp:
        return MaterialPageRoute(builder: (_) => const SignupPage());


      default:
        return MaterialPageRoute(
          builder: (_) =>  Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
