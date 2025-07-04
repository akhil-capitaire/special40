import 'package:flutter/material.dart';
import 'package:special40/utils/app_colors.dart';
import 'package:special40/utils/constants.dart';

import '../../utils/spaces.dart';

class HeroBannerMobile extends StatefulWidget {
  const HeroBannerMobile({super.key});

  @override
  State<HeroBannerMobile> createState() => HeroBannerMobileState();
}

class HeroBannerMobileState extends State<HeroBannerMobile>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> fadeText, fadeMetrics, fadeImage;
  late Animation<Offset> slideText, slideImage;
  late Animation<double> scaleImage;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..forward();

    fadeText = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: controller, curve: const Interval(0.1, 0.4)),
    );

    slideText = Tween<Offset>(begin: const Offset(0, 0.1), end: Offset.zero)
        .animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.1, 0.4, curve: Curves.easeOut),
          ),
        );

    fadeMetrics = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: controller, curve: const Interval(0.4, 0.6)),
    );

    fadeImage = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: controller, curve: const Interval(0.6, 1.0)),
    );

    slideImage = Tween<Offset>(begin: const Offset(0, 0.1), end: Offset.zero)
        .animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.6, 1.0, curve: Curves.easeOut),
          ),
        );

    scaleImage = Tween<double>(begin: 0.95, end: 1.0).animate(
      CurvedAnimation(parent: controller, curve: const Interval(0.6, 1.0)),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: const EdgeInsets.all(commonPaddingSize),
          decoration: BoxDecoration(
            color: AppColors.teal,
            borderRadius: BorderRadius.circular(commonRadiusSize),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FadeTransition(
                opacity: fadeText,
                child: SlideTransition(
                  position: slideText,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '#1 Job Oriented Course for B.Com Graduates',
                        style: TextStyle(
                          fontSize: baseFontSize + 4,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          height: 1.4,
                        ),
                      ),
                      sb(0, 1),
                      Text(
                        'Open to working professionals, B.Com/M.Com graduates, and ACCA/CMA (qualified or semi-qualified) candidates.',
                        style: TextStyle(
                          fontSize: baseFontSize + 2,
                          color: Colors.white70,
                          height: 1.5,
                        ),
                      ),
                      sb(0, 1),
                      Text(
                        'SPECIAL40 makes you job-ready!',
                        style: TextStyle(
                          fontSize: baseFontSize + 4,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              sb(0, 1),
              FadeTransition(
                opacity: fadeText,
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.secondary,
                      foregroundColor: Colors.black,
                      padding: EdgeInsets.symmetric(
                        vertical: commonPaddingSize,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(commonRadiusSize),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Explore Programs',
                      style: TextStyle(
                        fontSize: baseFontSize + 2,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              sb(0, 1),
              FadeTransition(
                opacity: fadeMetrics,
                child: const Row(
                  children: [
                    Metric(title: '1K+', subtitle: 'Learners'),
                    SizedBox(width: 24),
                    Metric(title: '20+', subtitle: 'Batches'),
                  ],
                ),
              ),
              sb(0, 10), // Space for the image pop-out
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          right: -150,
          left: 0,
          child: FadeTransition(
            opacity: fadeImage,
            child: SlideTransition(
              position: slideImage,
              child: ScaleTransition(
                scale: scaleImage,
                child: Center(
                  child: Image.asset(
                    'assets/images/Indrajith.png',
                    height: 200,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class Metric extends StatelessWidget {
  final String title;
  final String subtitle;

  const Metric({required this.title, required this.subtitle, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Text(
          subtitle,
          style: const TextStyle(fontSize: 14, color: Colors.white70),
        ),
      ],
    );
  }
}
