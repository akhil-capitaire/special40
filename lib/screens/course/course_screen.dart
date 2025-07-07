import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:special40/utils/app_colors.dart';
import 'package:special40/utils/buttons.dart';
import 'package:special40/utils/size.dart';
import 'package:special40/utils/spaces.dart';

import '../../utils/constants.dart';
import '../../utils/routes.dart';
import '../../widgets/chapter_card.dart';
import '../../widgets/custom_scaffold.dart';
import '../../widgets/expandable_text.dart';
import '../../widgets/review_card.dart';
import 'enroll_screen.dart';

class CourseScreen extends ConsumerStatefulWidget {
  const CourseScreen({super.key});

  @override
  ConsumerState<CourseScreen> createState() => CourseScreenState();
}

class CourseScreenState extends ConsumerState<CourseScreen> {
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      backButton: true,
      title: '',
      isScrollable: true,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(commonRadiusSize),
                  bottom: Radius.circular(commonRadiusSize),
                ),
                child: Image.asset(
                  'assets/images/demo/demo4.png',
                  height: ScreenSize.height(20), // Adjust height as needed
                  fit: BoxFit.fitWidth,
                  width: ScreenSize.screenWidth,
                ),
              ),
              Positioned(
                top: 50,
                left: 130,
                child: IconButton(
                  icon: Icon(Icons.play_circle, color: Colors.white, size: 60),
                  onPressed: () {},
                ),
              ),
            ],
          ),
          sb(0, 1),
          DefaultTabController(
            length: 3,
            child: Column(
              children: [
                TabBar(
                  labelColor: AppColors.teal,
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: AppColors.teal,
                  tabs: [
                    Tab(text: 'Overview'),
                    Tab(text: 'Lessons'),
                    Tab(text: 'Reviews'),
                  ],
                ),
                SizedBox(
                  height: ScreenSize.height(46), // Adjust height as needed
                  child: TabBarView(
                    children: [overView(), lessonView(), reviewView()],
                  ),
                ),
              ],
            ),
          ),
          sb(0, 1),
          CustomButton(
            label: "Enroll Now",
            onPressed: () {
              Navigator.pushNamed(context, Routes.enrollScreen);
            },
            isSmall: false,
            type: ButtonType.primary,
          ),
        ],
      ),
    );
  }

  chipBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: commonPaddingSize),
      height: 40,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              // color: AppColors.teal.withOpacity(0.1),
              border: Border.all(color: AppColors.grayLight, width: 1.0),
              borderRadius: BorderRadius.circular(commonRadiusSize),
            ),
            child: Text('UI / UX'),
          ),
          SizedBox(width: 8),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.grayLight, width: 1.0),
              borderRadius: BorderRadius.circular(commonRadiusSize),
            ),
            child: Text('Graphics Design'),
          ),
          SizedBox(width: 8),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.grayLight, width: 1.0),
              borderRadius: BorderRadius.circular(commonRadiusSize),
            ),
            child: Text('Figma'),
          ),
        ],
      ),
    );
  }

  overView() {
    final theme = Theme.of(context);
    return ListView(
      padding: EdgeInsets.only(top: commonPaddingSize),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Graphic Design', style: theme.textTheme.titleLarge),
                Text('By Syed Ali', style: theme.textTheme.titleSmall),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 16),
                    const SizedBox(width: 4),
                    Text("4.5", style: Theme.of(context).textTheme.bodySmall),
                  ],
                ),
              ],
            ),
            Text(
              '₹7000',
              style: theme.textTheme.titleLarge!.copyWith(fontSize: 20),
            ),
          ],
        ),
        sb(0, 2),

        ExpandableText(
          text:
              'Lorem ipsum dolor sit amet consectetur. Nec eget accumsan molestie proin. Integer rhoncus vitae nisi natoque ac mus tellus scelerisque gravida. Consectetur aliquet sit at diam. Augue eu mauris suspendisse adipiscing nibh. Nibh lorem id eu suspendisse nulla leo hendrerit. Erat tortor commodo quamfames et molestie.',
        ),
        sb(0, 2),
        buildCourseHighlightCard(),
        sb(0, 2),
        Text('Skills', style: theme.textTheme.titleLarge),
        sb(0, 2),
        chipBar(),
        sb(0, 2),
        chipBar(),
      ],
    );
  }

  lessonView() {
    return ListView(
      children: [
        sb(0, 1),
        ChapterCard(),
        sb(0, 1),
        ChapterCard(),
        sb(0, 1),
        ChapterCard(),
        sb(0, 1),
        ChapterCard(),
      ],
    );
  }

  reviewView() {
    return ListView(
      children: [
        sb(0, 1),
        ReviewCard(
          name: 'John Doe',
          role: 'Student',
          rating: 4,
          review:
              'This course was amazing! I learned so much and the instructor was very knowledgeable.',
        ),
        sb(0, 1),
        ReviewCard(
          name: 'John Doe',
          role: 'Student',
          rating: 4,
          review:
              'This course was amazing! I learned so much and the instructor was very knowledgeable.',
        ),
        sb(0, 1),
        ReviewCard(
          name: 'John Doe',
          role: 'Student',
          rating: 4,
          review:
              'This course was amazing! I learned so much and the instructor was very knowledgeable.',
        ),
      ],
    );
  }

  Widget buildCourseHighlightCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(commonRadiusSize),
      ),
      padding: EdgeInsets.all(commonPaddingSize),
      child: Wrap(
        spacing: 16,
        runSpacing: 12,
        children: const [
          CourseFeatureItem(icon: Icons.menu_book, text: '80+ Lectures'),
          CourseFeatureItem(icon: Icons.verified, text: 'Certificate'),
          CourseFeatureItem(icon: Icons.schedule, text: '8 Weeks'),
          CourseFeatureItem(icon: Icons.local_offer, text: '10% Off'),
        ],
      ),
    );
  }
}
