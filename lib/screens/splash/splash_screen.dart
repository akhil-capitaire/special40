import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../utils/constants.dart';
import '../../utils/routes.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  @override
  initState() {
    super.initState();
    gotoNextScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Image.asset('assets/images/logo.png')],
        ),
      ),
    );
  }

  gotoNextScreen() async {
    await Future.delayed(splashDuration, () async {
      bool loginStatus = true;
      // await SharedPreferenceUtils.getLoginStatus();
      if (loginStatus) {
        Navigator.pushReplacementNamed(context, Routes.onboard);
      } else {
        Navigator.pushReplacementNamed(context, Routes.onboard);
      }
    });
  }
}
