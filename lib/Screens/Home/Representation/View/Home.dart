import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:tampo_admin_app/Screens/Home/Data/Provider.dart';
import 'package:tampo_admin_app/Screens/Home/Representation/Widget/WidgetConatiner.dart';
import 'package:tampo_admin_app/Screens/Home/Representation/Widget/WidgetList.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsyncLength = ref.watch(fetchUsersFromRepoProvider).when(
          data: (users) => users.length,
          loading: () => null,
          error: (error, stackTrace) => null,
        );
    final projectsAsyncValue = ref.watch(fetchProjectsProvider).when(
          data: (project) => project.length,
          loading: () => null,
          error: (error, stackTrace) => null,
        );
    final tasksAsyncValue = ref.watch(fetchTasksProvider).when(
          data: (tasks) => tasks.length,
          loading: () => null,
          error: (error, stackTrace) => null,
        );
    final notesAsyncValue = ref.watch(fetchNotesProvider).when(
          data: (tasks) => tasks.length,
          loading: () => null,
          error: (error, stackTrace) => null,
        );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(240, 240, 240,0.3),
        title: const Text(
          'Tampo Admin',
          style: TextStyle(color: Colors.black38),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                WidgetConatiner(
                  title: 'Projects',
                  length: projectsAsyncValue != null
                      ? projectsAsyncValue.toString()
                      : '...',
                  icon: LucideIcons.folderKanban,
                  color: Colors.purple,
                  ontap: () => context.push('/ProjectListScreen'),
                ),
                WidgetConatiner(
                  title: 'Tasks',
                  length: tasksAsyncValue != null
                      ? tasksAsyncValue.toString()
                      : '...',
                  icon: LucideIcons.circleCheckBig,
                  color: Colors.orange,
                  ontap: () => context.push('/TaskListScreen'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                WidgetConatiner(
                  title: 'Notes',
                  length: notesAsyncValue != null
                      ? notesAsyncValue.toString()
                      : '...',
                  icon: LucideIcons.notepadText,
                  color: Colors.brown,
                  ontap: () {},
                ),
                WidgetConatiner(
                  title: 'User',
                  length: userAsyncLength != null
                      ? userAsyncLength.toString()
                      : '...',
                  icon: LucideIcons.users,
                  color: Colors.indigo,
                  ontap: () => context.push('/UserListScreen'),
                ),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Text(
                    'Links',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
            WidgetList(
              title: 'Feedbacks',
              ontap: () => context.push('/FeedBackScreen'),
            ),
            WidgetList(
              title: 'Reports',
              ontap: () => context.push('/ReportsScreen'),
            ),
          ],
        ),
      ),
    );
  }
}

CustomTransitionPage<void> buildCustomTransition(
  BuildContext context,
  GoRouterState state,
  Widget child,
) {
  return CustomTransitionPage<void>(
    child: child,
    transitionDuration: const Duration(milliseconds: 500),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.bounceInOut;

      final tween =
          Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      final offsetAnimation = animation.drive(tween);

      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
  );
}
