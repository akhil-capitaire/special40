import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:special40/utils/app_colors.dart';
import 'package:special40/utils/constants.dart';
import 'package:special40/utils/spaces.dart';

import '../../utils/routes.dart';
import '../../widgets/custom_scaffold.dart';

class SettingScreen extends ConsumerStatefulWidget {
  const SettingScreen({super.key});

  @override
  ConsumerState<SettingScreen> createState() => SettingScreenState();
}

class SettingScreenState extends ConsumerState<SettingScreen> {
  final emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final items = [
      {'icon': Icons.person, 'label': 'Edit Profile'},
      {'icon': Icons.payment, 'label': 'Payment Option'},
      {'icon': Icons.description, 'label': 'Terms & Conditions'},
      {'icon': Icons.headset_mic, 'label': 'Help Center'},
      {'icon': Icons.logout, 'label': 'Logout'},
    ];

    return CustomScaffold(
      backButton: true,
      title: 'Settings',
      isScrollable: false,
      body: Column(
        children: [
          sb(0, 4),
          Center(
            child: CircleAvatar(
              radius: 36,
              backgroundImage: AssetImage(
                'assets/images/profile.png',
              ), // replace with your asset/network path
            ),
          ),
          sb(0, 4),
          // Settings options container
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFFF5F7FB),
              borderRadius: BorderRadius.circular(commonRadiusSize),
            ),
            child: Column(
              children: items.map((item) {
                return ListTile(
                  leading: Icon(
                    item['icon'] as IconData,
                    color: AppColors.teal,
                  ),
                  title: Text(
                    item['label'] as String,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Colors.grey,
                  ),
                  onTap: () {
                    if (item['label'] == 'Logout') {
                      // Handle logout logic here
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        Routes.onboard,
                        (route) => false,
                      );
                      return;
                    } else if (item['label'] == 'Payment Option') {
                      // Navigate to payment options
                      Navigator.pushNamed(context, Routes.paymentOptions);
                      return;
                    } else if (item['label'] == 'Terms & Conditions') {
                      // Navigate to terms and conditions
                      // Navigator.pushNamed(context, Routes.termsAndConditions);
                      return;
                    } else if (item['label'] == 'Help Center') {
                      // Navigate to help center
                      // Navigator.pushNamed(context, Routes.helpCenter);
                      return;
                    } else if (item['label'] == 'Edit Profile') {
                      // Navigate to edit profile
                      Navigator.pushNamed(context, Routes.editProfile);
                      return;
                    }
                  },
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
