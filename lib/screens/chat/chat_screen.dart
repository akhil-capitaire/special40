import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:special40/providers/home_screen_provider.dart';
import 'package:special40/utils/spaces.dart';

import '../../utils/app_colors.dart';
import '../../utils/constants.dart';
import '../../widgets/custom_scaffold.dart';

class ChatScreen extends ConsumerStatefulWidget {
  const ChatScreen({super.key});

  @override
  ConsumerState<ChatScreen> createState() => ChatScreenState();
}

class ChatScreenState extends ConsumerState<ChatScreen> {
  int selectedTabIndex = 0; // 0: Chat, 1: Calls

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      backButton: true,
      title: 'Chats',
      isScrollable: false,
      onBackPressed: () {
        ref.read(homeScreenProvider.notifier).updateIndex(0);
      },
      body: Column(
        children: [
          sb(0, 2),
          searchBar(),
          sb(0, 2),
          Expanded(
            child: ListView.separated(
              itemCount: 3,
              separatorBuilder: (_, __) => const Divider(),
              itemBuilder: (_, index) {
                return buildChatItem(
                  name: "Ateeq Taj",
                  message: "Hi, How's you? How ‘s everything?",
                  time: "01:06 PM",
                  unreadCount: 2,
                  avatar: "assets/images/profile.png",
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget searchBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: commonPaddingSize),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(commonRadiusSize),
        border: Border.all(color: AppColors.grayLight, width: 1.0),
      ),
      child: Row(
        children: [
          Icon(Icons.search, color: AppColors.greyIcon),
          SizedBox(width: 8),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search here...',
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildChatItem({
    required String name,
    required String message,
    required String time,
    required int unreadCount,
    required String avatar,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(radius: 24, backgroundImage: AssetImage(avatar)),
      title: Text(name, style: const TextStyle(fontWeight: FontWeight.w600)),
      subtitle: Text(
        message,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(fontSize: 13),
      ),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFF0D9BAA),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              unreadCount.toString().padLeft(2, '0'),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 11,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(time, style: const TextStyle(fontSize: 11, color: Colors.grey)),
        ],
      ),
    );
  }
}
