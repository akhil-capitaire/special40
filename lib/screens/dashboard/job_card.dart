import 'package:flutter/material.dart';
import 'package:special40/utils/constants.dart';
import 'package:special40/utils/size.dart';
import 'package:special40/utils/spaces.dart';

class JobReadyBanner extends StatelessWidget {
  const JobReadyBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(commonPaddingSize),
      decoration: BoxDecoration(
        color: const Color(0xFF18324D), // Navy background
        borderRadius: BorderRadius.circular(commonRadiusSize),
      ),
      child: Row(
        children: [
          // Left side image
          Image.asset(
            'assets/images/interview.png', // Make sure the asset exists
            height: 120,
            width: 120,
            fit: BoxFit.cover,
          ),
          sb(5, 0),

          // Right side content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Are you job-ready?',
                  style: TextStyle(
                    fontSize: baseFontSize + 4,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                sb(0, 1),
                Text(
                  'Take the SPECIAL 40 Mock Interview to check your finance job readiness.',
                  style: TextStyle(
                    fontSize: baseFontSize,
                    color: Colors.white70,
                    height: 1.3,
                  ),
                ),
                sb(0, 1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: ScreenSize.height(3),
                      child: ElevatedButton.icon(
                        onPressed: () {
                          // TODO: Handle CTA
                        },
                        icon: const Icon(Icons.arrow_forward, size: 14),
                        label: const Text(
                          'Start Test',
                          style: TextStyle(fontSize: 13),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFF6A23D),
                          foregroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          minimumSize: const Size(0, 36),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
