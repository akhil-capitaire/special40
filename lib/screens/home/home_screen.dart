import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:special40/utils/app_colors.dart';

import '../../providers/home_screen_provider.dart';
import '../chat/chat_screen.dart';
import '../course/my_course.dart';
import '../dashboard/dashboard_screen.dart';
import '../profile/profile_screen.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final index = ref.watch(homeScreenProvider);

    List<Widget> body = [
      DashboardScreen(),
      MyCourseScreen(),
      ChatScreen(),
      ProfileScreen(),
    ];

    return PopScope(
      canPop: index == 0,
      onPopInvokedWithResult: (bool didPop, Object? result) {
        if (!didPop && index != 0) {
          ref.read(homeScreenProvider.notifier).updateIndex(0);
        }
      },
      child: Scaffold(
        body: body[index],
        bottomNavigationBar: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            // Curved background container
            Container(height: 80),
            // Floating pill-style nav bar
            Positioned(
              bottom: 16,
              left: 16,
              right: 16,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: AppColors.blueLight,
                  borderRadius: BorderRadius.circular(40),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    bottomNavItem(
                      icon: LucideIcons.home,
                      label: "Home",
                      index: 0,
                      isActive: index == 0,
                      onTap: () =>
                          ref.read(homeScreenProvider.notifier).updateIndex(0),
                    ),
                    bottomNavItem(
                      icon: LucideIcons.bookOpen,
                      label: "Courses",
                      index: 1,
                      isActive: index == 1,
                      onTap: () =>
                          ref.read(homeScreenProvider.notifier).updateIndex(1),
                    ),
                    bottomNavItem(
                      icon: LucideIcons.messageCircle,
                      label: "Chat",
                      index: 2,
                      isActive: index == 2,
                      onTap: () =>
                          ref.read(homeScreenProvider.notifier).updateIndex(2),
                    ),
                    bottomNavItem(
                      icon: Icons.person_2_outlined,
                      label: "Profile",
                      index: 3,
                      isActive: index == 3,
                      onTap: () =>
                          ref.read(homeScreenProvider.notifier).updateIndex(3),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget bottomNavItem({
    required IconData icon,
    required String label,
    required int index,
    required bool isActive,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: isActive ? 26 : 24,
            color: isActive ? AppColors.teal : Colors.black54,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
              color: isActive ? AppColors.teal : Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}
