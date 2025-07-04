import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:special40/utils/app_colors.dart';
import 'package:special40/utils/constants.dart';
import 'package:special40/utils/spaces.dart';

import '../../utils/routes.dart';
import '../../widgets/custom_scaffold.dart';
import 'course_card.dart';
import 'hero_banner.dart';

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
                      text: 'Fawais',
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
          sb(0, 2),
          HeroBannerMobile(),
          sb(0, 2),
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
                      text: 'Continue Watching',
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
                  Text('View All'),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: AppColors.grayLight,
                    size: 16,
                  ),
                ],
              ),
            ],
          ),
          sb(0, 1),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.7,
            ),
            itemCount: 4, // Change this to your actual item count
            itemBuilder: (context, index) {
              return CourseCard(
                title: 'Graphic Design',
                star: 4,
                imageUrl: 'assets/images/demo/demo${index + 1}.png',
                progress: 50,
              );
            },
          ),
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
