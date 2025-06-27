import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../utils/constants.dart';

class CustomScaffold extends ConsumerStatefulWidget {
  bool backButton = false;
  bool isScrollable = true;
  String title = '';
  Widget body;
  CustomScaffold({
    super.key,
    required this.body,
    this.backButton = false,
    this.title = '',
    this.isScrollable = true,
  });

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
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: widget.backButton
              ? IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Colors.black,
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                )
              : null,
          title: Text(
            widget.title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        body: ColorfulSafeArea(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.only(
              top: commonPaddingSize + 10,
              left: commonPaddingSize + 10,
              right: commonPaddingSize + 10,
              bottom: commonPaddingSize,
            ),
            child: widget.isScrollable
                ? SingleChildScrollView(child: widget.body)
                : widget.body,
          ),
        ),
      ),
    );
  }
}
