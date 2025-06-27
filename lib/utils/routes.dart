import 'package:flutter/material.dart';
import 'package:special40/screens/signin/signin_method_screen.dart';
import 'package:special40/screens/signin/signin_mobile.dart';
import 'package:special40/screens/signup/signup_screen.dart';

import '../screens/onboard/onboard_screen.dart';
import '../screens/splash/splash_screen.dart';

class Routes {
  static const String splash = '/';
  static const String onboard = '/onboard';
  static const String signInMethod = '/signInMethod';
  static const String signInMobile = '/signInMobile';
  static const String signUp = '/signUp';
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments as Map<String, dynamic>?;
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case onboard:
        return MaterialPageRoute(builder: (_) => OnboardScreen());
      case signInMethod:
        return MaterialPageRoute(builder: (_) => SignInMethodScreen());
      case signInMobile:
        return MaterialPageRoute(builder: (_) => SignInMobile());
      case signUp:
        return MaterialPageRoute(builder: (_) => SignUpScreen());
      default:
        return MaterialPageRoute(builder: (_) => SplashScreen());
    }
  }
}
