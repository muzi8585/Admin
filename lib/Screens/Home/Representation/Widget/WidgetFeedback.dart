import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class FeedbackWidget extends StatelessWidget {
  final String feedbackLevel;

  FeedbackWidget({required this.feedbackLevel});

  @override
  Widget build(BuildContext context) {
    IconData feedbackIcon;

    switch (feedbackLevel) {
      case 'FeedbackType.terrible':
        feedbackIcon = LucideIcons.angry;
        break;
      case 'FeedbackType.bad':
        feedbackIcon = LucideIcons.annoyed;
        break;
      case 'FeedbackType.okay':
        feedbackIcon = LucideIcons.meh;
        break;
      case 'FeedbackType.good':
        feedbackIcon = LucideIcons.smile;
        break;
      case 'FeedbackType.amazing':
        feedbackIcon = LucideIcons.laugh;
        break;
      default:
        feedbackIcon = Icons.help;
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.grey[100]!)),
      child: Center(
          child: Row(
        children: [
          Icon(
            feedbackIcon,
            size: 12,
            color: Colors.grey[500],
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            feedbackLevel.split('.').length > 1
                ? feedbackLevel.split('.')[1].trim().toUpperCase()
                : '',
            style: TextStyle(
              fontSize: 10,
              color: Colors.black45,
            ),
          )
        ],
      )),
    );
  }
}
