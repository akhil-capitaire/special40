import 'package:flutter/material.dart';
import 'package:special40/utils/app_colors.dart';
import 'package:special40/utils/constants.dart';
import '../../utils/spaces.dart';

class HeroBannerMobile extends StatefulWidget {
  const HeroBannerMobile({super.key});

  @override
  State<HeroBannerMobile> createState() => _HeroBannerMobileState();
}

class _HeroBannerMobileState extends State<HeroBannerMobile>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation<double> fadeText, fadeMetrics, fadeImage;
  late final Animation<Offset> slideText, slideImage;
  late final Animation<double> scaleImage;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..forward();

    fadeText = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: controller, curve: const Interval(0.1, 0.4)),
    );

    slideText = Tween(begin: const Offset(0, 0.1), end: Offset.zero).animate(
      CurvedAnimation(parent: controller, curve: const Interval(0.1, 0.4)),
    );

    fadeMetrics = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: controller, curve: const Interval(0.4, 0.6)),
    );

    fadeImage = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: controller, curve: const Interval(0.6, 1.0)),
    );

    slideImage = Tween(begin: const Offset(0, 0.1), end: Offset.zero).animate(
      CurvedAnimation(parent: controller, curve: const Interval(0.6, 1.0)),
    );

    scaleImage = Tween(begin: 0.95, end: 1.0).animate(
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
                        'Get Job-Ready',
                        style: TextStyle(
                          fontSize: baseFontSize + 4,
                          fontWeight: FontWeight.bold,
                          color: AppColors.secondary,
                        ),
                      ),
                      sb(0, 0.5),
                      Text(
                        'B.Com Graduates | Working Professionals',
                        style: TextStyle(
                          fontSize: baseFontSize + 1,
                          color: Colors.white70,
                        ),
                      ),
                    ],
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
              sb(0, 8),
              FadeTransition(
                opacity: fadeText,
                child: Text(
                  'Learn from \nIndustry Experts',
                  style: TextStyle(
                    fontSize: baseFontSize + 4,
                    fontWeight: FontWeight.w700,
                    color: AppColors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: -200,
          child: FadeTransition(
            opacity: fadeImage,
            child: SlideTransition(
              position: slideImage,
              child: ScaleTransition(
                scale: scaleImage,
                child: Center(
                  child: Image.asset(
                    'assets/images/Indrajith.png',
                    height: 180,
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
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Text(
          subtitle,
          style: const TextStyle(fontSize: 13, color: Colors.white70),
        ),
      ],
    );
  }
}
