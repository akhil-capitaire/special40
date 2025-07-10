import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:special40/utils/buttons.dart';
import 'package:special40/utils/spaces.dart';
import 'package:special40/widgets/form_input.dart';

import '../../widgets/custom_scaffold.dart';

class EditProfileScreen extends ConsumerStatefulWidget {
  const EditProfileScreen({super.key});

  @override
  ConsumerState<EditProfileScreen> createState() => EditProfileScreenState();
}

class EditProfileScreenState extends ConsumerState<EditProfileScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final numberController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool obscureText = true;

  // ignore: non_constant_identifier_names
  bool confirmObscureText = true;

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
                'Edit Profile',
                style: theme.textTheme.bodyMedium!.copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              sb(0, 1),
              Text(
                'Update your information to keep your profile current',
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
            controller: confirmPasswordController,
            hintText: 'Confirm Password',
            obscureText: confirmObscureText,
            suffix: IconButton(
              icon: Icon(
                confirmObscureText ? Icons.visibility : Icons.visibility_off,
              ),
              onPressed: () {
                setState(() {
                  confirmObscureText = !confirmObscureText;
                });
              },
            ),
          ),
          sb(0, 8),
          CustomButton(
            label: 'Update Profile',
            onPressed: () {},
            isSmall: false,
            type: ButtonType.primary,
          ),
        ],
      ),
    );
  }
}
