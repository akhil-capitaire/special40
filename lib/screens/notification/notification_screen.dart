import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:special40/utils/app_colors.dart';
import 'package:special40/utils/constants.dart';

import '../../widgets/custom_scaffold.dart';

class NotificationScreen extends ConsumerStatefulWidget {
  const NotificationScreen({super.key});

  @override
  ConsumerState<NotificationScreen> createState() => NotificationScreenState();
}

class NotificationScreenState extends ConsumerState<NotificationScreen> {
  final emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CustomScaffold(
      backButton: true,
      title: 'Notifications',
      isScrollable: true,
      body: buildNotificationList(),
    );
  }

  Widget buildNotificationList() {
    // Placeholder for notification list widget
    return Column(
      children: List.generate(10, (index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: buildNotificationItem(
            icon: Icons.check,
            title: "Transaction Successfully!",
            subtitle: "Lorem ipsum dolor sit amet consectetur.",
            time: "5 mins ago",
          ),
        );
      }),
    );
  }

  Widget buildNotificationItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required String time,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.blueLight,
        borderRadius: BorderRadius.circular(commonRadiusSize),
      ),
      padding: EdgeInsets.all(commonPaddingSize),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Leading Icon with blue circle
          Container(
            padding: EdgeInsets.all(commonPaddingSize / 2),
            decoration: const BoxDecoration(
              color: AppColors.teal, // Deep Blue
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: Colors.white, size: 20),
          ),
          const SizedBox(width: 12),
          // Title and Subtitle
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
          // Time Text
          Text(time, style: const TextStyle(fontSize: 11, color: Colors.grey)),
        ],
      ),
    );
  }
}
