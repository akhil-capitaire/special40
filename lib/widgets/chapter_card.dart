import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:special40/utils/app_colors.dart';
import 'package:special40/utils/constants.dart';
import 'package:special40/utils/spaces.dart';

class ChapterCard extends ConsumerStatefulWidget {
  const ChapterCard({super.key});

  @override
  ConsumerState<ChapterCard> createState() => ChapterCardState();
}

class ChapterCardState extends ConsumerState<ChapterCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.blueLight,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(commonRadiusSize),
      ),
      child: Column(
        children: [buildHeader(), if (isExpanded) buildChapterDetails()],
      ),
    );
  }

  Widget buildHeader() {
    return ListTile(
      title: const Text(
        'Chapter 1: What is Graphics Designing?',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      trailing: Icon(
        isExpanded ? Icons.expand_less : Icons.expand_more,
        color: Colors.black54,
      ),
      onTap: () => setState(() => isExpanded = !isExpanded),
    );
  }

  Widget buildChapterDetails() {
    return Padding(
      padding: EdgeInsets.all(commonPaddingSize / 2),
      child: Column(
        children: const [
          ChapterItem(
            icon: Icons.play_circle,
            label: 'Lorem ipsum dolor sit amet consectetur.',
          ),
          ChapterItem(
            icon: Icons.assignment,
            label: 'Lorem ipsum dolor sit amet consectetur.',
          ),
          ChapterItem(
            icon: Icons.play_circle,
            label: 'Lorem ipsum dolor sit amet consectetur.',
          ),
          ChapterItem(
            icon: Icons.assignment,
            label: 'Lorem ipsum dolor sit amet consectetur.',
          ),
        ],
      ),
    );
  }
}

class ChapterItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const ChapterItem({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: commonPaddingSize / 2),
      child: Row(
        children: [
          Icon(icon, color: Colors.blue.shade900),
          sb(4, 0),
          Expanded(
            child: Text(label, style: TextStyle(fontSize: baseFontSize + 2)),
          ),
        ],
      ),
    );
  }
}
