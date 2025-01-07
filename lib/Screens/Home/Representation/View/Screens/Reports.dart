// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:go_router/go_router.dart';
// import 'package:lucide_icons_flutter/lucide_icons.dart';
// import 'package:tampo_admin_app/Screens/Home/Data/Provider.dart';

// class ReportsScreen extends ConsumerStatefulWidget {
//   const ReportsScreen({super.key});

//   @override
//   _ReportsScreenState createState() => _ReportsScreenState();
// }

// class _ReportsScreenState extends ConsumerState<ReportsScreen> {
//   @override
//   void initState() {
//     super.initState();
//     ref.read(reportsProvider.notifier).loadReports();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final reports = ref.watch(reportsProvider);

//     if (reports.isEmpty) {
//       return Scaffold(
//         appBar: AppBar(title: const Text('Reports')),
//         body: const Center(child: CircularProgressIndicator()),
//       );
//     }

//     return Scaffold(
//       appBar: AppBar(
//         leading: InkWell(
//           onTap: () => context.go('/home'),
//           child: const Icon(LucideIcons.chevronLeft),
//         ),
//         title: const Text('Reports')),
//       body: ListView.builder(
//         itemCount: reports.length,
//         itemBuilder: (context, index) {
//           final report = reports[index];

//           return ListTile(
//             title: Text(report.title), // Displaying issue name
//             subtitle: Text(report.email), // Displaying email
//             trailing: Text(report.createdAt.toIso8601String()), // Show created date
//           );
//         },
//       ),
//     );
//   }
// }
