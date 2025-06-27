import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:special40/utils/buttons.dart';
import 'package:special40/utils/spaces.dart';
import 'package:special40/widgets/form_input.dart';

import '../../utils/routes.dart';
import '../../widgets/custom_scaffold.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => SignUpScreenState();
}

class SignUpScreenState extends ConsumerState<SignUpScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final numberController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();
  bool obscureText = true;
  bool ConfirmObscureText = true;

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
                'Sign Up',
                style: theme.textTheme.bodyMedium!.copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              sb(0, 1),
              Text(
                'Create an account to begin your Learning Journey',
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
          FormInput(controller: nameController, hintText: 'Name'),
          sb(0, 1),
          FormInput(
            controller: emailController,
            hintText: 'Email',
            keyboardType: TextInputType.emailAddress,
          ),
          sb(0, 1),
          FormInput(
            controller: numberController,
            hintText: 'Phone Number',
            keyboardType: TextInputType.phone,
          ),
          sb(0, 1),
          FormInput(
            controller: passwordController,
            hintText: 'Password',
            obscureText: obscureText,
            suffix: IconButton(
              icon: Icon(obscureText ? Icons.visibility : Icons.visibility_off),
              onPressed: () {
                setState(() {
                  obscureText = !obscureText;
                });
              },
            ),
          ),
          sb(0, 1),
          FormInput(
            controller: confirmpasswordController,
            hintText: 'Confirm Password',
            obscureText: ConfirmObscureText,
            suffix: IconButton(
              icon: Icon(
                ConfirmObscureText ? Icons.visibility : Icons.visibility_off,
              ),
              onPressed: () {
                setState(() {
                  ConfirmObscureText = !ConfirmObscureText;
                });
              },
            ),
          ),
          sb(0, 6),
          Column(
            children: [
              CustomButton(
                label: 'Sign Up',
                onPressed: () {},
                isSmall: false,
                type: ButtonType.primary,
              ),
              sb(0, 2),
              Row(
                children: [
                  Expanded(
                    child: Divider(color: Colors.grey.shade400, thickness: 1),
                  ),
                  sb(0, 1),
                  Text(
                    'Do you have an account?',
                    style: theme.textTheme.bodyMedium!.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Colors.black54,
                    ),
                  ),
                  sb(0, 1),
                  Expanded(
                    child: Divider(color: Colors.grey.shade400, thickness: 1),
                  ),
                ],
              ),
              sb(0, 2),
              CustomButton(
                label: 'Sign In',
                onPressed: () {
                  Navigator.pushNamed(context, Routes.signInMethod);
                },
                isSmall: false,
                type: ButtonType.outlined,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
