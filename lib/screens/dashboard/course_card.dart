import 'package:flutter/material.dart';
import 'package:special40/utils/app_colors.dart';
import 'package:special40/utils/constants.dart';

import '../../utils/routes.dart';

class CourseCard extends StatelessWidget {
  final String title;
  final int star;
  final String imageUrl;
  final int progress; // percentage

  const CourseCard({
    super.key,
    required this.title,
    required this.star,
    required this.imageUrl,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle card tap
        // For example, navigate to course details page
        Navigator.pushNamed(context, Routes.courseScreen);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(commonRadiusSize),
              bottom: Radius.circular(commonRadiusSize),
            ),
            child: Image.asset(
              imageUrl,
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleMedium,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 16),
                        const SizedBox(width: 4),
                        Text(
                          star.toString(),
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                const SizedBox(height: 12),
                LinearProgressIndicator(
                  value: progress / 100,
                  minHeight: 6,
                  backgroundColor: Colors.grey[200],
                  color: AppColors.teal,
                ),
                const SizedBox(height: 6),
                Text(
                  '$progress% completed',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
