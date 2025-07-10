import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:special40/providers/home_screen_provider.dart';
import 'package:special40/utils/buttons.dart';

import '../../utils/app_colors.dart';
import '../../utils/constants.dart';
import '../../utils/routes.dart';
import '../../utils/spaces.dart';
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
          sb(0, 6),
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
                Text(
                  'Akhil KB',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: baseFontSize + 2,
                  ),
                ),
                sb(0, 2),
                Text(
                  'Flutter Developer',
                  style: TextStyle(fontSize: baseFontSize, color: Colors.grey),
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
                  'A passionate developer with experience in building beautiful and functional Flutter applications. Always eager to learn and take on new challenges.',
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
          Spacer(),
          CustomButton(
            label: 'Edit Profile',
            onPressed: () {
              Navigator.pushNamed(context, Routes.editProfile);
            },
            isSmall: false,
            type: ButtonType.primary,
          ),
          sb(0, 1),
        ],
      ),
    );
  }

  Widget buildSkillChip(String label) {
    return Container(
      padding: EdgeInsets.all(commonPaddingSize / 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Text(label, style: TextStyle(fontSize: baseFontSize)),
    );
  }
}
