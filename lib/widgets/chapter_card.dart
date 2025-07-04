import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
      color: Colors.grey.shade100,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          ListTile(
            title: Text(
              'Chapter 1: What is Graphics Designing?',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            trailing: Icon(
              isExpanded ? Icons.expand_less : Icons.expand_more,
              color: Colors.black54,
            ),
            onTap: () => setState(() => isExpanded = !isExpanded),
          ),
          if (isExpanded)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                children: [
                  buildIconRow(
                    Icons.play_circle,
                    'Lorem ipsum dolor sit amet consectetur.',
                  ),
                  buildIconRow(
                    Icons.assignment,
                    'Lorem ipsum dolor sit amet consectetur.',
                  ),
                  buildIconRow(
                    Icons.play_circle,
                    'Lorem ipsum dolor sit amet consectetur.',
                  ),
                  buildIconRow(
                    Icons.assignment,
                    'Lorem ipsum dolor sit amet consectetur.',
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget buildIconRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(icon, color: Colors.blue.shade900),
          const SizedBox(width: 12),
          Expanded(child: Text(text, style: const TextStyle(fontSize: 14))),
        ],
      ),
    );
  }
}
