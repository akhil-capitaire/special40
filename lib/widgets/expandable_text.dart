import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  final int truncateLength;

  const ExpandableText({
    super.key,
    required this.text,
    this.truncateLength = 120,
  });

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final shouldTruncate = widget.text.length > widget.truncateLength;
    final displayText = expanded || !shouldTruncate
        ? widget.text
        : '${widget.text.substring(0, widget.truncateLength)}...';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(displayText, style: theme.textTheme.bodyMedium),
        if (shouldTruncate)
          GestureDetector(
            onTap: () => setState(() => expanded = !expanded),
            child: Text(
              expanded ? 'Show Less' : 'Read More',
              style: theme.textTheme.bodySmall?.copyWith(
                color: AppColors.teal,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
      ],
    );
  }
}
