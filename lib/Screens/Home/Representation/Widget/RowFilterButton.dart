import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tampo_admin_app/Screens/Home/Data/Provider.dart'; // Import this for Google Fonts (if needed)

final selectedLevelProvider = StateProvider<String>((ref) => 'All Level');

class RowWidgetButtons extends ConsumerWidget {
  var selectedLevel;
  RowWidgetButtons({super.key, required this.selectedLevel});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final feedbackAsyncValue = ref.watch(fetchFeedbackProvider).when(
          data: (feedback) => feedback.length,
          loading: () => null,
          error: (error, stackTrace) => null,
        );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
      child: Row(
        children: [
          FilterButton(
            text: 'All ($feedbackAsyncValue)',
            onTap: () =>
                ref.read(selectedLevelProvider.state).state = 'All Level',
            selected: selectedLevel == 'All Level',
          ),
          FilterButton(
            text: 'Amazing',
            onTap: () => ref.read(selectedLevelProvider.state).state =
                'FeedbackType.amazing',
            selected: selectedLevel == 'FeedbackType.amazing',
          ),
          FilterButton(
            text: 'Good',
            onTap: () => ref.read(selectedLevelProvider.state).state =
                'FeedbackType.good',
            selected: selectedLevel == 'FeedbackType.good',
          ),
          FilterButton(
            text: 'Okay',
            onTap: () => ref.read(selectedLevelProvider.state).state =
                'FeedbackType.okay',
            selected: selectedLevel == 'FeedbackType.okay',
          ),
          FilterButton(
            text: 'Bad',
            onTap: () => ref.read(selectedLevelProvider.state).state =
                'FeedbackType.bad',
            selected: selectedLevel == 'FeedbackType.bad',
          ),
          FilterButton(
            text: 'Terrible',
            onTap: () => ref.read(selectedLevelProvider.state).state =
                'FeedbackType.terrible',
            selected: selectedLevel == 'FeedbackType.terrible',
          ),
        ],
      ),
    );
  }
}

class FilterButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final bool selected;

  const FilterButton({
    required this.text,
    required this.onTap,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 3),
      child: InkWell(
        borderRadius: BorderRadius.circular(30),
        onTap: onTap,
        child: Container(
          padding:
              const EdgeInsets.only(right: 7.5, left: 7.5, top: 3, bottom: 3),
          decoration: BoxDecoration(
            color: selected ? Colors.teal : Colors.grey[100],
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: selected ? Colors.teal : Colors.transparent,
            ),
          ),
          child: Text(
            text,
            maxLines: 1,
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: selected ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
