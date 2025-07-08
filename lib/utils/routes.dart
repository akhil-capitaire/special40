import 'package:flutter/material.dart';
import 'package:special40/screens/home/home_screen.dart';
import 'package:special40/screens/notification/notification_screen.dart';
import 'package:special40/screens/settings/settings_screen.dart';
import 'package:special40/screens/signin/otp_screen.dart';
import 'package:special40/screens/signin/signin_method_screen.dart';
import 'package:special40/screens/signin/signin_mobile.dart';
import 'package:special40/screens/signup/signup_screen.dart';

import '../screens/chat/chat_room_screen.dart';
import '../screens/course/course_screen.dart';
import '../screens/course/enroll_screen.dart';
import '../screens/onboard/onboard_screen.dart';
import '../screens/signin/signin_email.dart';
import '../screens/splash/splash_screen.dart';

class Routes {
  static const String splash = '/';
  static const String onboard = '/onboard';
  static const String signInMethod = '/signInMethod';
  static const String signInMobile = '/signInMobile';
  static const String signUp = '/signUp';
  static const String otp = '/otp';
  static const String signInEmail = '/signInEmail';
  static const String home = '/home';
  static const String chatRoom = '/chatRoom';
  static const String courseScreen = '/courseScreen';
  static const String enrollScreen = '/enrollScreen';
  static const String notificationScreen = '/notificationScreen';
  static const String settingScreen = '/settingScreen';
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
      case signInEmail:
        return MaterialPageRoute(builder: (_) => SignInEmail());
      case home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case courseScreen:
        return MaterialPageRoute(builder: (_) => CourseScreen());
      case enrollScreen:
        return MaterialPageRoute(builder: (_) => CourseEnrollmentPage());
      case otp:
        return MaterialPageRoute(
          builder: (_) => OtpScreen(email: args?['email']),
        );
      case signUp:
        return MaterialPageRoute(builder: (_) => SignUpScreen());
      case chatRoom:
        return MaterialPageRoute(builder: (_) => ChatRoomScreen());
      case notificationScreen:
        return MaterialPageRoute(builder: (_) => NotificationScreen());
      case settingScreen:
        return MaterialPageRoute(builder: (_) => SettingScreen());
      default:
        return MaterialPageRoute(builder: (_) => SplashScreen());
    }
  }
}
