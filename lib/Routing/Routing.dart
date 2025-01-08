import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tampo_admin_app/Screens/Home/Representation/View/Home.dart';
import 'package:tampo_admin_app/Screens/Home/Representation/View/Screens/FeedBackScreen.dart';
import 'package:tampo_admin_app/Screens/Home/Representation/View/Screens/Reports.dart';
import 'package:tampo_admin_app/Screens/Home/Representation/View/Screens/UserScreen.dart';

part 'Routing.g.dart';

enum PageTransitionType {
  slideFromBottom,
  fade,
}

@riverpod
GoRouter appRouter(ProviderRef ref) {
  return GoRouter(
    initialLocation: '/home',
    routes: [
      GoRoute(
        path: '/home',
        pageBuilder: (context, state) => buildCustomTransition(
          context,
          state,
          HomeScreen(),
          transitionType: PageTransitionType.fade,
        ),
      ),
      GoRoute(
        path: '/UserListScreen',
        pageBuilder: (context, state) => buildCustomTransition(
          context,
          state,
          UserListScreen(),
          transitionType: PageTransitionType.fade,
        ),
      ),
      GoRoute(
        path: '/FeedBackScreen',
        pageBuilder: (context, state) => buildCustomTransition(
          context,
          state,
          const FeedbackScreen(),
          transitionType: PageTransitionType.fade,
        ),
      ),
      GoRoute(
        path: '/ReportsScreen',
        pageBuilder: (context, state) => buildCustomTransition(
          context,
          state,
          const ReportsScreen(),
          transitionType: PageTransitionType.fade,
        ),
      ),
    ],
  );
}

CustomTransitionPage<void> buildCustomTransition(
  BuildContext context,
  GoRouterState state,
  Widget child, {
  PageTransitionType transitionType = PageTransitionType.slideFromBottom,
}) {
  return CustomTransitionPage<void>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      switch (transitionType) {
        case PageTransitionType.fade:
          return FadeTransition(opacity: animation, child: child);
        case PageTransitionType.slideFromBottom:
        default:
          const begin = Offset(0.0, 1.0);
          const end = Offset.zero;
          const curve = Curves.easeInOut;
          final tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          final offsetAnimation = animation.drive(tween);

          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
      }
    },
  );
}
