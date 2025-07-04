import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:special40/utils/buttons.dart';
import 'package:special40/utils/spaces.dart';
import 'package:special40/widgets/form_input.dart';

import '../../utils/routes.dart';
import '../../widgets/custom_scaffold.dart';

class SignInEmail extends ConsumerStatefulWidget {
  const SignInEmail({super.key});

  @override
  ConsumerState<SignInEmail> createState() => SignInEmailState();
}

class SignInEmailState extends ConsumerState<SignInEmail> {
  final emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CustomScaffold(
      backButton: true,
      title: '',
      isScrollable: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                'Sign In With Email',
                style: theme.textTheme.bodyMedium!.copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              sb(0, 1),
              Text(
                'Use your email id to sign in',
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

          FormInput(
            controller: emailController,
            hintText: 'Email Address',
            keyboardType: TextInputType.emailAddress,
          ),
          Spacer(),
          CustomButton(
            label: 'Continue',
            onPressed: () {
              Navigator.pushNamed(
                context,
                Routes.otp,
                arguments: {'email': emailController.text},
              );
            },
            isSmall: false,
            type: ButtonType.primary,
          ),
        ],
      ),
    );
  }
}
