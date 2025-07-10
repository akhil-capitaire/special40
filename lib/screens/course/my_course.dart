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
  final allCourses = [
    {
      'title': 'AFM India',
      'author': 'Shoaib Hassan',
      'image': 'assets/images/courses/AFM-India.png',
      'progress': 72.0,
    },
    {
      'title': 'AFM Gulf',
      'author': 'HMI Waqar',
      'image': 'assets/images/courses/AFM-Gulf.png',
      'progress': 100.0,
    },
    {
      'title': 'AFM Plus',
      'author': 'Adnan Yousaf',
      'image': 'assets/images/courses/AFM-Plus.png',
      'progress': 26.0,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final ongoingCourses = allCourses
        .where((c) => c['progress'] as double < 100)
        .toList();
    final completedCourses = allCourses
        .where((c) => c['progress'] as double >= 100)
        .toList();

    return DefaultTabController(
      length: 2,
      child: CustomScaffold(
        backButton: true,
        title: 'My Courses',
        isScrollable: false,
        onBackPressed: () {
          ref.read(homeScreenProvider.notifier).updateIndex(0);
        },
        body: Column(
          children: [
            TabBar(
              labelColor: AppColors.teal,
              unselectedLabelColor: Colors.grey,
              indicatorColor: AppColors.teal,
              dividerHeight: 0,
              tabs: const [
                Tab(text: 'Ongoing'),
                Tab(text: 'Completed'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  buildCourseList(ongoingCourses),
                  buildCourseList(completedCourses),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCourseList(List<Map<String, dynamic>> courses) {
    if (courses.isEmpty) {
      return const Center(
        child: Text(
          'No courses available',
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      );
    }

    return ListView.separated(
      padding: EdgeInsets.symmetric(vertical: commonPaddingSize),
      itemCount: courses.length,
      separatorBuilder: (_, __) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        final course = courses[index];
        return buildCourseCard(
          title: course['title']!,
          author: course['author']!,
          imagePath: course['image']!,
          progress: (course['progress']! as double) / 100,
        );
      },
    );
  }

  Widget buildCourseCard({
    required String title,
    required String author,
    required String imagePath,
    required double progress,
  }) {
    return Material(
      elevation: 2,
      color: AppColors.blueLight,
      borderRadius: BorderRadius.circular(commonRadiusSize),
      child: Container(
        padding: EdgeInsets.all(commonPaddingSize),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(commonRadiusSize),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(commonRadiusSize),
              child: Image.asset(
                imagePath,
                width: 100,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
            sb(3, 0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: baseFontSize + 2,
                      color: Colors.black87,
                    ),
                  ),

                  sb(0, 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${(progress * 100).toInt()}% Completed',
                        style: TextStyle(
                          fontSize: baseFontSize - 1,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  sb(0, 1),
                  LinearProgressIndicator(
                    value: progress,
                    minHeight: 6,
                    backgroundColor: Colors.grey.shade300,
                    valueColor: AlwaysStoppedAnimation(AppColors.teal),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
