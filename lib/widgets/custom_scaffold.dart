import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../utils/constants.dart';

class CustomScaffold extends ConsumerStatefulWidget {
  Widget body;
  CustomScaffold({super.key, required this.body});

  @override
  ConsumerState<CustomScaffold> createState() => CustomScaffoldState();
}

class CustomScaffoldState extends ConsumerState<CustomScaffold> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: ColorfulSafeArea(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.only(
              top: commonPaddingSize + 10,
              left: commonPaddingSize + 10,
              right: commonPaddingSize + 10,
              bottom: commonPaddingSize,
            ),
            child: SingleChildScrollView(child: widget.body),
          ),
        ),
      ),
    );
  }
}
