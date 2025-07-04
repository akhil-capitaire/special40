import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pinput/pinput.dart';
import 'package:special40/utils/app_colors.dart';

import '../../utils/buttons.dart';
import '../../utils/constants.dart';
import '../../utils/routes.dart';
import '../../utils/spaces.dart';
import '../../widgets/custom_scaffold.dart';

class OtpScreen extends StatefulWidget {
  final String email;
  bool get isMobile => email.contains('@') == false;
  const OtpScreen({super.key, required this.email});

  @override
  OtpScreenState createState() => OtpScreenState();
}

class OtpScreenState extends State<OtpScreen> {
  final TextEditingController pinController = TextEditingController();
  final FocusNode focusNode = FocusNode();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool otpeError = false;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CustomScaffold(
      isScrollable: false,
      title: '',
      backButton: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'OTP Verification',
                style: theme.textTheme.bodyMedium!.copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              sb(0, 1),
              Text(
                'Enter the OTP sent to your ${widget.isMobile ? "mobile number" : "email"}',
                style: theme.textTheme.bodyMedium!.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              sb(0, 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(commonRadiusSize),
                      color: AppColors.gray,
                    ),
                    padding: EdgeInsets.all(commonPaddingSize),
                    child: Text(
                      widget.isMobile ? "Change number" : "Change email",
                      style: theme.textTheme.bodyMedium!.copyWith(
                        fontSize: baseFontSize,
                        fontWeight: FontWeight.normal,
                        color: AppColors.black,
                      ),
                    ),
                  ),
                ],
              ),
              sb(0, 2),
              Pinput(
                forceErrorState: otpeError,
                closeKeyboardWhenCompleted: true,
                length: 6,
                controller: pinController,
                focusNode: focusNode,
                defaultPinTheme: PinTheme(
                  width: 56,
                  height: 56,
                  textStyle: TextStyle(
                    fontSize: 22,
                    color: Color.fromRGBO(30, 60, 87, 1),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(commonRadiusSize),
                    border: Border.all(color: AppColors.gray),
                  ),
                ),
                separatorBuilder: (index) => const SizedBox(width: 8),
                validator: (value) {
                  return value != '' ? null : 'Pin is incorrect';
                },
                hapticFeedbackType: HapticFeedbackType.lightImpact,
                onCompleted: (pin) {},
                onChanged: (value) {
                  if (value.length == 6) {
                    setState(() {
                      otpeError = false;
                    });
                  }
                },
                cursor: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 9),
                      width: 22,
                      height: 1,
                      color: AppColors.teal,
                    ),
                  ],
                ),
                focusedPinTheme: PinTheme(
                  width: 56,
                  height: 56,
                  textStyle: TextStyle(
                    fontSize: 22,
                    color: Color.fromRGBO(30, 60, 87, 1),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(commonRadiusSize),
                    border: Border.all(color: AppColors.teal),
                  ),
                ),
                submittedPinTheme: PinTheme(
                  width: 56,
                  height: 56,
                  textStyle: TextStyle(
                    fontSize: 22,
                    color: Color.fromRGBO(30, 60, 87, 1),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(commonRadiusSize),
                    border: Border.all(color: AppColors.teal),
                  ),
                ),
                errorPinTheme: PinTheme(
                  width: 56,
                  height: 56,
                  textStyle: TextStyle(
                    fontSize: 22,
                    color: Color.fromRGBO(30, 60, 87, 1),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(commonRadiusSize),
                    border: Border.all(color: Colors.redAccent),
                  ),
                ),
              ),
            ],
          ),

          Spacer(),
          Consumer(
            builder: (context, ref, child) {
              return Column(
                children: [
                  CustomButton(
                    type: ButtonType.primary,
                    label: "Continue",
                    onPressed: () async {
                      Navigator.pushNamed(context, Routes.home);
                    },
                    isSmall: false,
                  ),
                  sb(0, 2),
                  CustomButton(
                    label: 'Resend OTP',
                    onPressed: () async {},
                    isSmall: false,
                    type: ButtonType.outlined,
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
