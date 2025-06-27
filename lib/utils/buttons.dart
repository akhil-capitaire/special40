import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:special40/utils/app_colors.dart';

import 'constants.dart';

enum ButtonType { primary, secondary, grey, outlined, cardButton }

// ignore: must_be_immutable
class CustomButton extends ConsumerStatefulWidget {
  final String label;
  final Function onPressed;
  final bool isSmall;
  final ButtonType type;
  bool noCurve = false;
  CustomButton({
    super.key,
    required this.label,
    required this.onPressed,
    required this.isSmall,
    required this.type,
    this.noCurve = false,
  });

  @override
  ConsumerState<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends ConsumerState<CustomButton> {
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
        return Color(0xffF8F9A6);
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
        return Color(0xffF8F9A6);
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
