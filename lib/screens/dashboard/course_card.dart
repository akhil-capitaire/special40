import 'package:flutter/material.dart';
import 'package:special40/utils/app_colors.dart';
import 'package:special40/utils/constants.dart';
import 'package:special40/utils/size.dart';
import 'package:special40/utils/spaces.dart';

import '../../utils/routes.dart';

class CourseCard extends StatelessWidget {
  final String title;
  final double star;
  final String imageUrl;
  final int progress; // percentage
  final bool isComingSoon;

  const CourseCard({
    super.key,
    required this.title,
    required this.star,
    required this.imageUrl,
    required this.progress,
    this.isComingSoon = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, Routes.courseScreen);
      },
      child: Card(
        color: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(commonRadiusSize),
        ),
        elevation: 2,
        child: SizedBox(
          height: ScreenSize.height(24),
          width: ScreenSize.width(50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(commonRadiusSize),
                ),
                child: Image.asset(
                  imageUrl,
                  height: 110,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(commonPaddingSize),
                child: Column(
                  crossAxisAlignment: isComingSoon
                      ? CrossAxisAlignment.center
                      : CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: isComingSoon
                          ? MainAxisAlignment.center
                          : MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title,
                          style: Theme.of(context).textTheme.titleMedium,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        if (!isComingSoon)
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
                    sb(0, 1),
                    if (!isComingSoon)
                      LinearProgressIndicator(
                        value: progress / 100,
                        minHeight: 6,
                        backgroundColor: Colors.grey[200],
                        color: AppColors.teal,
                      ),
                    if (isComingSoon)
                      Text(
                        'Coming Soon',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    sb(0, 1),
                    if (!isComingSoon)
                      Text(
                        '$progress% completed',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
