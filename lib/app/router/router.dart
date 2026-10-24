import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lab/di/di.dart';
import '../app.dart';
import 'package:talker_flutter/talker_flutter.dart';

final _rootNavigationKey = GlobalKey<NavigatorState>(debugLabel: 'root');

final router = GoRouter(
  observers: [TalkerRouteObserver(talker)],
  debugLogDiagnostics: true,
  initialLocation: '/home',
  navigatorKey: _rootNavigationKey,
  routes: [
    GoRoute(
      path: '/home',
      pageBuilder: (_, state) => MaterialPage(
        key: state.pageKey,
        child: const HomeScreen() as Widget,
      ),
    ),
    // для следующей лабораторной работы
    // GoRoute(
    //   path: '/content/:id',
    //   pageBuilder: (_, state) => MaterialPage(
    //     key: state.pageKey,
    //     child: ContentScreen(contentId: state.pathParameters['id']!),
    //   ),
    // ),
  ],
);
