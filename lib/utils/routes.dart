import 'package:flutter/material.dart';
import 'package:special40/screens/signin/signin_screen.dart';

import '../screens/onboard/onboard_screen.dart';
import '../screens/splash/splash_screen.dart';

class Routes {
  static const String splash = '/';
  static const String onboard = '/onboard';
  static const String signIn = '/signIn';
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments as Map<String, dynamic>?;
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case onboard:
        return MaterialPageRoute(builder: (_) => OnboardScreen());
      case signIn:
        return MaterialPageRoute(builder: (_) => SignInScreen());
      default:
        return MaterialPageRoute(builder: (_) => SplashScreen());
    }
  }
}
