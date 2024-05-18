import 'package:bybuapp/pages/auth/signin.dart';
import 'package:bybuapp/pages/auth/signup.dart';
import 'package:bybuapp/pages/auth/splash/splash.dart';
import 'package:bybuapp/pages/dashboard/homepage/homepage.dart';
import 'package:bybuapp/pages/dashboard/setting/settingpage.dart';
import 'package:flutter/material.dart';

class Routes {
  static String splash = "splash";
  static String signin = "signin";
  static String signup = "signup";
  static String home = "home";
  static String setting = "setting";
}

class AppRouter {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case "splash":
        return MaterialPageRoute(builder: (context) => const SplashPage());
      case "signin":
        return MaterialPageRoute(builder: (context) => const SignInPage());
      case "signup":
        return MaterialPageRoute(builder: (context) => const SignUpPage());

      case "home":
        return MaterialPageRoute(builder: (context) => const HomePage());
      case "setting":
        return MaterialPageRoute(builder: (context) => const SettingPage());
    }

    return MaterialPageRoute(builder: (context) => const SplashPage());
  }
}
