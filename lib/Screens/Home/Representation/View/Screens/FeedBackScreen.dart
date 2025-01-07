// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:go_router/go_router.dart';
// import 'package:lucide_icons_flutter/lucide_icons.dart';
// import 'package:tampo_admin_app/Screens/Home/Data/Provider.dart';

// class FeedbackScreen extends ConsumerWidget {
//   const FeedbackScreen({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final feedbackAsyncValue = ref.watch(fetchFeedbackProvider);

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Feedbacks'),
//         leading: InkWell(
//           onTap: () => context.go('/home'),
//           child: const Icon(LucideIcons.chevronLeft),
//         ),
//       ),
//       body: feedbackAsyncValue.when(
//         data: (feedbacks) {
//           return ListView.builder(
//             itemCount: feedbacks.length,
//             itemBuilder: (context, index) {
//               final feedback = feedbacks[index];
//               return ListTile(
//                 title: Text(feedback.level),
//                 subtitle: Text(feedback.description),
//               );
//             },
//           );
//         },
//         error: (error, stack) {
//           print(error);
//           return Center(child: Text('Error: $error'));
//         },
//         // Loading state
//         loading: () {
//           return const Center(child: CircularProgressIndicator());
//         },
//       ),
//     );
//   }
// }
