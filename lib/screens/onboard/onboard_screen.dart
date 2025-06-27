import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:special40/utils/app_colors.dart';
import 'package:special40/utils/buttons.dart';
import 'package:special40/utils/size.dart';

import '../../models/onboard_model.dart';
import '../../utils/constants.dart';
import '../../utils/routes.dart';

class OnboardScreen extends ConsumerStatefulWidget {
  const OnboardScreen({super.key});

  @override
  ConsumerState<OnboardScreen> createState() => OnboardScreenState();
}

class OnboardScreenState extends ConsumerState<OnboardScreen> {
  final PageController pageController = PageController();
  int currentIndex = 0;
  Timer? timer;

  final List<OnboardModel> pages = onboardScreens;

  @override
  void initState() {
    super.initState();
    startAutoScroll();
  }

  void startAutoScroll() {
    timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (currentIndex < pages.length - 1) {
        currentIndex++;
        pageController.animateToPage(
          currentIndex,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      } else {
        timer?.cancel();
      }
    });
  }

  void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    timer?.cancel();
    super.dispose();
  }

  bool continueClick = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: !continueClick
            ? [
                PageView.builder(
                  controller: pageController,
                  itemCount: 4,
                  onPageChanged: onPageChanged,
                  itemBuilder: (context, index) {
                    final page = pages[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24.0,
                        vertical: 60,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            page.image,
                            height: ScreenSize.width(60),
                            width: ScreenSize.width(60),
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(height: 32),
                          Text(
                            page.text,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          const SizedBox(height: 12),
                          Text(
                            page.subtext,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    );
                  },
                ),
                skipButton(),
                Positioned(
                  bottom: 90,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(4, (index) {
                      final selected = currentIndex == index;
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        height: 8,
                        width: selected ? 20 : 8,
                        decoration: BoxDecoration(
                          color: selected ? AppColors.teal : Colors.grey,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      );
                    }),
                  ),
                ),
                Positioned(
                  bottom: 30,
                  left: 24,
                  right: 24,
                  child: CustomButton(
                    label: 'Continue',
                    onPressed: () {
                      setState(() {
                        continueClick = true;
                      });
                    },
                    isSmall: false,
                    type: ButtonType.primary,
                  ),
                ),
              ]
            : [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24.0,
                    vertical: 60,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        pages[4].image.toString(),
                        height: ScreenSize.width(60),
                        width: ScreenSize.width(60),
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(height: 32),
                      Text(
                        pages[4].text,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        pages[4].subtext,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
                skipButton(),
                Positioned(
                  bottom: 150,
                  left: 24,
                  right: 24,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: ScreenSize.width(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomButton(
                          label: 'Sign Up',
                          onPressed: () {
                            setState(() {
                              continueClick = true;
                            });
                          },
                          isSmall: true,
                          type: ButtonType.primary,
                        ),
                        CustomButton(
                          label: 'Sign In',
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                              context,
                              Routes.signIn,
                            );
                          },
                          isSmall: true,
                          type: ButtonType.outlined,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
      ),
    );
  }

  skipButton() {
    return Positioned(
      top: 40,
      right: 24,
      child: TextButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, Routes.signIn);
        },
        child: Text(
          'Skip',
          style: TextStyle(color: AppColors.teal, fontSize: 16),
        ),
      ),
    );
  }
}
