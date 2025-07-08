import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:special40/utils/app_colors.dart';
import 'package:special40/utils/constants.dart';
import 'package:special40/utils/size.dart';
import 'package:special40/utils/spaces.dart';

import '../../utils/routes.dart';
import '../../widgets/custom_scaffold.dart';
import 'course_card.dart';
import 'hero_banner.dart';
import 'job_card.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState<DashboardScreen> createState() => DashboardScreenState();
}

class DashboardScreenState extends ConsumerState<DashboardScreen> {
  final emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CustomScaffold(
      backButton: false,
      title: '',
      isScrollable: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: theme.textTheme.bodyMedium!.copyWith(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: 'Welcome, ',
                      style: theme.textTheme.bodyMedium!.copyWith(
                        fontSize: 24,
                        fontWeight: FontWeight.normal,
                        color: Colors.black, // Example: highlight the name
                      ),
                    ),
                    TextSpan(
                      text: 'Akhil',
                      style: theme.textTheme.bodyMedium!.copyWith(
                        fontSize: 24,
                        fontWeight: FontWeight.normal,
                        color: AppColors.teal, // Example: highlight the name
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.settings, color: AppColors.greyIcon),
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.settingScreen);
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.notifications, color: AppColors.greyIcon),
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.notificationScreen);
                    },
                  ),
                ],
              ),
            ],
          ),
          sb(0, 1),
          HeroBannerMobile(),
          sb(0, 1),
          Row(
            children: [
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: theme.textTheme.bodyMedium!.copyWith(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: 'Courses we offer ',
                      style: theme.textTheme.bodyMedium!.copyWith(
                        fontSize: baseFontSize + 4,
                        fontWeight: FontWeight.normal,
                        color: Colors.black, // Example: highlight the name
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Row(
                children: [
                  // Text('View All'),
                  Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16),
                ],
              ),
            ],
          ),
          sb(0, 1),
          SizedBox(
            height: ScreenSize.height(25),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                spacing: 20,
                children: [
                  CourseCard(
                    title: 'AFM India',
                    star: 4,
                    imageUrl: 'assets/images/courses/AFM-India.png',
                    progress: 50,
                  ),
                  CourseCard(
                    title: 'AFM Gulf',
                    star: 4.5,
                    imageUrl: 'assets/images/courses/AFM-Gulf.png',
                    progress: 50,
                  ),
                  CourseCard(
                    title: 'AFM Plus',
                    star: 3.9,
                    imageUrl: 'assets/images/courses/AFM-Plus.png',
                    progress: 50,
                    isComingSoon: true,
                  ),
                  // Add more CourseCard widgets here as needed
                ],
              ),
            ),
          ),
          sb(0, 1),
          JobReadyBanner(),
          sb(0, 1),
        ],
      ),
    );
  }

  Widget buildBanner() {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/Indrajith.png'),
          fit: BoxFit.contain,
        ),
      ),
      child: Center(
        child: Text(
          'Special40',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
