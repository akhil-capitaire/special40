import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:special40/providers/home_screen_provider.dart';
import 'package:special40/utils/app_colors.dart';
import 'package:special40/utils/constants.dart';
import 'package:special40/utils/spaces.dart';

import '../../widgets/custom_scaffold.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => ProfileScreenState();
}

class ProfileScreenState extends ConsumerState<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      backButton: true,
      title: 'Profile',
      isScrollable: false,
      onBackPressed: () {
        ref.read(homeScreenProvider.notifier).updateIndex(0);
      },
      body: Column(
        children: [
          sb(0, 8),
          // Profile Image
          Center(
            child: CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage(
                'assets/images/profile.png',
              ), // Replace with actual image
            ),
          ),
          sb(0, 4),
          // Profile Card
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.blueLight,
              borderRadius: BorderRadius.circular(commonRadiusSize),
            ),
            padding: EdgeInsets.all(commonPaddingSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Name, Tagline, Edit Icon
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Name Here',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: baseFontSize + 2,
                            ),
                          ),
                          sb(0, 2),
                          Text(
                            'Tag Line',
                            style: TextStyle(
                              fontSize: baseFontSize,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(Icons.edit, size: 18, color: Colors.grey.shade600),
                  ],
                ),
                sb(0, 2),
                // About Me
                Text(
                  'About Me',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: baseFontSize + 2,
                  ),
                ),
                sb(0, 2),
                Text(
                  'Lorem ipsum dolor sit amet consectetur. Nec eget accumsan molestie proin. Integer rhoncus vitae nisi natoque ac mus tellus scelerisque gravida.',
                  style: TextStyle(fontSize: baseFontSize, color: Colors.grey),
                ),
                sb(0, 2),
                // My Skills
                Text(
                  'My Skills',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: baseFontSize + 2,
                  ),
                ),
                sb(0, 2),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    buildSkillChip('UI/UX'),
                    buildSkillChip('Graphics Design'),
                    buildSkillChip('Figma'),
                    buildSkillChip('Video Editor'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSkillChip(String label) {
    return Container(
      padding: EdgeInsets.all(commonPaddingSize),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(commonRadiusSize),
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Text(label, style: TextStyle(fontSize: baseFontSize)),
    );
  }
}
