import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:special40/utils/buttons.dart';
import 'package:special40/utils/spaces.dart';
import 'package:special40/widgets/form_input.dart';

import '../../utils/routes.dart';
import '../../widgets/custom_scaffold.dart';

class SignInMobile extends ConsumerStatefulWidget {
  const SignInMobile({super.key});

  @override
  ConsumerState<SignInMobile> createState() => SignInMobileState();
}

class SignInMobileState extends ConsumerState<SignInMobile> {
  final numberController = TextEditingController();
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
                'Sign In With Mobile Number',
                style: theme.textTheme.bodyMedium!.copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              sb(0, 1),
              Text(
                'Use your mobile number to sign in',
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
            controller: numberController,
            hintText: 'Mobile Number',
            keyboardType: TextInputType.number,
          ),
          Spacer(),
          CustomButton(
            label: 'Continue',
            onPressed: () {
              Navigator.pushNamed(
                context,
                Routes.otp,
                arguments: {'email': numberController.text},
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
