import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:special40/providers/home_screen_provider.dart';
import 'package:special40/utils/app_colors.dart';
import 'package:special40/utils/constants.dart';

import '../../utils/spaces.dart';
import '../../widgets/custom_scaffold.dart';

class MyCourseScreen extends ConsumerStatefulWidget {
  const MyCourseScreen({super.key});

  @override
  ConsumerState<MyCourseScreen> createState() => MyCourseScreenState();
}

class MyCourseScreenState extends ConsumerState<MyCourseScreen> {
  @override
  Widget build(BuildContext context) {
    final courses = [
      {
        'title': 'Wireframing Fundamentals',
        'author': 'Shoaib Hassan',
        'image': 'assets/images/demo/demo1.png',
      },
      {
        'title': 'UI UX Designing',
        'author': 'HMI Waqar',
        'image': 'assets/images/demo/demo2.png',
      },
      {
        'title': 'Website Design',
        'author': 'Adnan Yousaf',
        'image': 'assets/images/demo/demo3.png',
      },
      {
        'title': 'Figma Basics',
        'author': 'Usman Diljan',
        'image': 'assets/images/demo/demo4.png',
      },
    ];

    return CustomScaffold(
      backButton: true,
      title: 'My Courses',
      isScrollable: false,
      onBackPressed: () {
        ref.read(homeScreenProvider.notifier).updateIndex(0);
      },
      body: ListView.separated(
        itemCount: courses.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final course = courses[index];
          return buildCourseCard(
            title: course['title']!,
            author: course['author']!,
            imagePath: course['image']!,
            progress: 0.35,
          );
        },
      ),
    );
  }

  Widget buildCourseCard({
    required String title,
    required String author,
    required String imagePath,
    required double progress,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.blueLight,
        borderRadius: BorderRadius.circular(commonRadiusSize),
      ),
      padding: EdgeInsets.all(commonPaddingSize),
      child: Row(
        children: [
          // Thumbnail Image
          ClipRRect(
            borderRadius: BorderRadius.circular(commonRadiusSize),
            child: Image.asset(
              imagePath,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          sb(2, 0),
          // Title, Author, Progress
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: baseFontSize + 2,
                  ),
                ),
                sb(2, 0),
                Text(
                  'By $author',
                  style: TextStyle(fontSize: baseFontSize, color: Colors.grey),
                ),
                sb(2, 0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 4),
                      child: Text(
                        '${(progress * 100).toInt()}% Done',
                        style: TextStyle(
                          fontSize: baseFontSize - 1,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
                sb(2, 0),
                LinearProgressIndicator(
                  value: progress,
                  color: AppColors.teal,
                  backgroundColor: Colors.grey.shade300,
                  minHeight: 5,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
