import 'package:flutter/material.dart';

class ReviewCard extends StatelessWidget {
  final String name;
  final String role;
  final String review;
  final int rating;

  const ReviewCard({
    super.key,
    required this.name,
    required this.role,
    required this.review,
    this.rating = 5,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey.shade100,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(radius: 24, backgroundColor: Colors.grey),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        role,
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(
                    rating,
                    (index) =>
                        const Icon(Icons.star, color: Colors.blue, size: 18),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(review, style: const TextStyle(fontSize: 14)),
          ],
        ),
      ),
    );
  }
}
