import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:tampo_admin_app/Screens/Home/Data/Provider.dart';
import 'package:tampo_admin_app/Screens/Home/Representation/Widget/FeedbackShimmer.dart';
import 'package:tampo_admin_app/Screens/Home/Representation/Widget/ProjectShimmer.dart';
import 'package:tampo_admin_app/Screens/Home/Representation/Widget/RowFilterButton.dart';
import 'package:tampo_admin_app/Screens/Home/Representation/Widget/WidgetFeedback.dart';

class FeedbackScreen extends ConsumerWidget {
  const FeedbackScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final feedbackFuture = ref.watch(fetchFeedbackProvider);
    final usersFuture = ref.watch(fetchUsersName);

    final selectedLevel = ref.watch(selectedLevelProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: InkWell(
          onTap: () => context.push('/home'),
          child: const Icon(LucideIcons.chevronLeft),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: const Text('Feedback List'),
      ),
      body: RefreshIndicator(
        backgroundColor: Colors.white,
        color: Colors.teal,
        onRefresh: () async {
          await ref.refresh(fetchFeedbackProvider);
        },
        child: Column(
          children: [
            RowWidgetButtons(selectedLevel: selectedLevel),
            Expanded(
              child: feedbackFuture.when(
                skipLoadingOnRefresh: false,
                data: (feedbacks) {
                  if (feedbacks.isEmpty) {
                    return const Center(child: Text('No feedback available.'));
                  }

                  List filteredFeedbacks = selectedLevel == 'All Level'
                      ? feedbacks
                      : feedbacks
                          .where((feedback) => feedback.level == selectedLevel)
                          .toList();
                  if (filteredFeedbacks.isEmpty) {
                    return const Center(
                        child: Text(
                      'There is No Feedback...',
                      style: TextStyle(color: Colors.black38),
                    ));
                  }
                  return usersFuture.when(
                    data: (users) {
                      return ListView.builder(
                        itemCount: filteredFeedbacks.length,
                        itemBuilder: (context, index) {
                          final feedback = filteredFeedbacks[index];
                          final user = users.firstWhere(
                            (project) => project.userUID.contains(feedback.uid),
                          );
                          return Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border(
                                bottom: BorderSide(
                                    color: Colors.grey[100]!, width: 1),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  user.name,
                                  style: const TextStyle(
                                    color: Colors.black38,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  feedback.description,
                                  style: const TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    FeedbackWidget(
                                        feedbackLevel: feedback.level),
                                    const Spacer(),
                                    Text(
                                      formatDate(feedback.createdAt),
                                      style: const TextStyle(
                                          color: Colors.black38,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    loading: () => const Projectshimmer(),
                    error: (error, stack) =>
                        Center(child: Text('Error loading users: $error')),
                  );
                },
                loading: () => const Feedbackshimmer(),
                error: (error, stack) =>
                    Center(child: Text('Error loading feedbacks: $error')),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String formatDate(DateTime dateTime) {
    return DateFormat('MMM dd, yyyy').format(dateTime);
  }
}
