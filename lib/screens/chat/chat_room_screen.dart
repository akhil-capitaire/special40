import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:special40/utils/constants.dart';
import 'package:special40/utils/spaces.dart';

import '../../utils/app_colors.dart';
import '../../widgets/custom_scaffold.dart';

class ChatRoomScreen extends ConsumerStatefulWidget {
  const ChatRoomScreen({super.key});

  @override
  ConsumerState<ChatRoomScreen> createState() => ChatRoomScreenState();
}

class ChatRoomScreenState extends ConsumerState<ChatRoomScreen> {
  final TextEditingController messageController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollController.jumpTo(scrollController.position.maxScrollExtent);
    });
  }

  @override
  void dispose() {
    messageController.dispose();
    scrollController.dispose();
    super.dispose();
  }

  void sendMessage() {
    final text = messageController.text.trim();
    if (text.isEmpty) return;
    messageController.clear();
    scrollController.animateTo(
      scrollController.position.maxScrollExtent + 60,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      backButton: true,
      title: 'Chat Room',
      isScrollable: false,
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              padding: const EdgeInsets.symmetric(vertical: commonPaddingSize),
              itemCount: 20,
              itemBuilder: (context, index) {
                final isMe = index.isEven; // mock: alternate sender
                return Align(
                  alignment: isMe
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    padding: EdgeInsets.all(commonPaddingSize),
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.7,
                    ),
                    decoration: BoxDecoration(
                      color: isMe ? AppColors.grayLight : AppColors.teal,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      'Message ${index + 1}',
                      style: TextStyle(
                        color: isMe ? Colors.black : Colors.white,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: messageController,
                  decoration: InputDecoration(
                    hintText: 'Type a message...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(commonRadiusSize),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: commonPaddingSize,
                      vertical: commonPaddingSize,
                    ),
                  ),
                  onSubmitted: (_) => sendMessage(),
                ),
              ),
              sb(5, 0),
              IconButton(
                onPressed: sendMessage,
                icon: const Icon(Icons.send),
                color: Colors.blueAccent,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
