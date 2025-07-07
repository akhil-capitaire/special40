import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:special40/utils/app_colors.dart';

import 'constants.dart';

enum ButtonType { primary, secondary, grey, outlined, cardButton }

class CustomButton extends ConsumerStatefulWidget {
  final String label;
  final Function onPressed;
  final bool isSmall;
  final ButtonType type;
  final bool noCurve;
  const CustomButton({
    super.key,
    required this.label,
    required this.onPressed,
    required this.isSmall,
    required this.type,
    this.noCurve = false,
  });

  @override
  ConsumerState<CustomButton> createState() => CustomButtonState();
}

class CustomButtonState extends ConsumerState<CustomButton> {
  Color getBackgroundColor() {
    switch (widget.type) {
      case ButtonType.primary:
        return AppColors.teal;
      case ButtonType.secondary:
        return AppColors.blueAccent;
      case ButtonType.grey:
        return Colors.grey[300]!;
      case ButtonType.outlined:
        return Colors.white;
      case ButtonType.cardButton:
        return AppColors.secondary;
    }
  }

  Color getForgroundgroundColor() {
    switch (widget.type) {
      case ButtonType.primary:
        return Colors.white;
      case ButtonType.secondary:
        return Colors.black;
      case ButtonType.grey:
        return Colors.black;
      case ButtonType.outlined:
        return AppColors.teal;
      case ButtonType.cardButton:
        return Colors.black;
    }
  }

  Color getBorderColor() {
    switch (widget.type) {
      case ButtonType.primary:
        return AppColors.teal;
      case ButtonType.secondary:
        return AppColors.blueAccent;
      case ButtonType.grey:
        return Colors.grey[300]!;
      case ButtonType.outlined:
        return AppColors.teal;
      case ButtonType.cardButton:
        return AppColors.secondary;
    }
  }

  final buttonLoadingProvider = StateProvider<Map<ButtonType, bool>>(
    (ref) => {},
  );
  Color _getTextColor() {
    return widget.type == ButtonType.grey || widget.type == ButtonType.secondary
        ? Colors.black
        : Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    final loading = ref.watch(buttonLoadingProvider)[widget.type] ?? false;

    return SizedBox(
      width: widget.isSmall ? null : double.infinity,
      height: widget.isSmall ? 40.0 : 48.0, // Set height directly
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: getForgroundgroundColor(),
          padding: EdgeInsets.symmetric(
            horizontal: commonPaddingSize,
          ), // Remove default padding
          backgroundColor: getBackgroundColor(),
          shape: RoundedRectangleBorder(
            side: BorderSide(color: getBorderColor()),
            borderRadius: widget.noCurve
                ? BorderRadius.only(
                    bottomLeft: Radius.circular(commonRadiusSize),
                    bottomRight: Radius.circular(commonRadiusSize),
                  )
                : BorderRadius.circular(commonRadiusSize),
          ),
        ),
        onPressed: loading
            ? null
            : () async {
                ref
                    .read(buttonLoadingProvider.notifier)
                    .update((state) => {...state, widget.type: true});
                await widget.onPressed();
                ref
                    .read(buttonLoadingProvider.notifier)
                    .update((state) => {...state, widget.type: false});
              },
        child: loading
            ? Transform.scale(
                scale: 0.4,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(_getTextColor()),
                ),
              )
            : Text(
                widget.label,
                textAlign: TextAlign.center,
                maxLines: 1,
                style: TextStyle(
                  color: getForgroundgroundColor(),
                  fontSize: baseFontSize + 6,
                ),
              ),
      ),
    );
  }
}

enum SignInMethod { email, mobile, google, apple }

class CustomSignInButton extends StatelessWidget {
  final SignInMethod method;
  final VoidCallback onPressed;
  final bool isLoading;

  const CustomSignInButton({
    super.key,
    required this.method,
    required this.onPressed,
    this.isLoading = false,
  });

  String getLabel() {
    switch (method) {
      case SignInMethod.email:
        return 'Sign in with Email';
      case SignInMethod.mobile:
        return 'Sign in with Mobile';
      case SignInMethod.google:
        return 'Sign in with Google';
      case SignInMethod.apple:
        return 'Sign in with Apple';
    }
  }

  IconData getIcon() {
    switch (method) {
      case SignInMethod.email:
        return Icons.email_outlined;
      case SignInMethod.mobile:
        return Icons.phone_android;
      case SignInMethod.google:
        return FontAwesomeIcons.google;
      case SignInMethod.apple:
        return FontAwesomeIcons.apple;
    }
  }

  Color getBackgroundColor(BuildContext context) {
    switch (method) {
      case SignInMethod.google:
        return Colors.white;
      case SignInMethod.apple:
        return Colors.black;
      default:
        return AppColors.teal;
    }
  }

  Color getTextColor(BuildContext context) {
    switch (method) {
      case SignInMethod.google:
        return Colors.black;
      case SignInMethod.apple:
        return Colors.white;
      default:
        return Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: double.infinity,
      child: ElevatedButton.icon(
        icon: isLoading
            ? const SizedBox.shrink()
            : Icon(getIcon(), color: getTextColor(context)),
        label: isLoading
            ? Transform.scale(
                scale: 0.5,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    getTextColor(context),
                  ),
                ),
              )
            : Text(
                getLabel(),
                style: TextStyle(
                  color: getTextColor(context),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
        style: ElevatedButton.styleFrom(
          backgroundColor: getBackgroundColor(context),
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: method == SignInMethod.google
                ? const BorderSide(color: Colors.grey)
                : BorderSide.none,
          ),
        ),
        onPressed: isLoading ? null : onPressed,
      ),
    );
  }
}
