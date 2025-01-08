import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

enum FeedbackType {
  terrible,
  bad,
  okay,
  good,
  amazing,
}

class FeedbackData {
  final IconData icon;
  final String text;

  FeedbackData(this.icon, this.text);
}

FeedbackType getFeedbackTypeFromText(String text) {
  // Normalize the input by trimming and converting to lowercase
  String normalizedText = text.trim().toLowerCase();

  switch (normalizedText) {
    case 'terrible':
      return FeedbackType.terrible;
    case 'bad':
      return FeedbackType.bad;
    case 'okay':
      return FeedbackType.okay;
    case 'good':
      return FeedbackType.good;
    case 'amazing':
      return FeedbackType.amazing;
    default:
      throw Exception('Unknown feedback type: $text');
  }
}

FeedbackData getFeedbackDataFromText(String text) {
  try {
    FeedbackType feedbackType = getFeedbackTypeFromText(text);

    switch (feedbackType) {
      case FeedbackType.terrible:
        return FeedbackData(LucideIcons.angry, 'Terrible');
      case FeedbackType.bad:
        return FeedbackData(LucideIcons.annoyed, 'Bad');
      case FeedbackType.okay:
        return FeedbackData(LucideIcons.meh, 'Okay');
      case FeedbackType.good:
        return FeedbackData(LucideIcons.smile, 'Good');
      case FeedbackType.amazing:
        return FeedbackData(LucideIcons.laugh, 'Amazing');
      default:
        // Handle unrecognized feedback type
        throw Exception('Unknown feedback type: $text');
    }
  } catch (e) {
    // Catch exceptions and handle errors
    return FeedbackData(Icons.error, 'Unknown Feedback Type');
  }
}

class FeedbackWidget extends StatelessWidget {
  final String feedbackText;

  FeedbackWidget({required this.feedbackText});

  @override
  Widget build(BuildContext context) {
    // Get the feedback data from the input text
    FeedbackData feedbackData = getFeedbackDataFromText(feedbackText);

    return Scaffold(
      appBar: AppBar(
        title: Text('Feedback Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(feedbackData.icon, size: 50), // Show the corresponding icon
            SizedBox(height: 10),
            Text(feedbackData.text, style: TextStyle(fontSize: 24)), // Show the feedback text
          ],
        ),
      ),
    );
  }
}

