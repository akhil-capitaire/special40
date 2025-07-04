import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:special40/utils/buttons.dart';
import 'package:special40/utils/spaces.dart';

import '../../utils/routes.dart';
import '../../utils/size.dart';
import '../../widgets/custom_scaffold.dart';

class SignInMethodScreen extends ConsumerStatefulWidget {
  const SignInMethodScreen({super.key});

  @override
  ConsumerState<SignInMethodScreen> createState() => SignInMethodScreenState();
}

class SignInMethodScreenState extends ConsumerState<SignInMethodScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CustomScaffold(
      backButton: true,
      title: '',
      body: Column(
        children: [
          Column(
            children: [
              Text(
                'Sign In',
                style: theme.textTheme.bodyMedium!.copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              sb(0, 1),
              Text(
                'Please Sign in with your account',
                style: theme.textTheme.bodyMedium!.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              sb(0, 2),
            ],
          ),
          Image.asset(
            "assets/images/illustrations/login.png",
            height: ScreenSize.width(60),
            width: ScreenSize.width(60),
            fit: BoxFit.contain,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomSignInButton(
                method: SignInMethod.mobile,
                onPressed: () {
                  Navigator.pushNamed(context, Routes.signInMobile);
                },
                isLoading: false,
              ),
              sb(0, 2),
              CustomSignInButton(
                method: SignInMethod.email,
                onPressed: () {
                  Navigator.pushNamed(context, Routes.signInEmail);
                },
                isLoading: false,
              ),
              sb(0, 2),
              CustomSignInButton(
                method: SignInMethod.google,
                onPressed: () {},
                isLoading: false,
              ),
              sb(0, 2),
              CustomSignInButton(
                method: SignInMethod.apple,
                onPressed: () {},
                isLoading: false,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
