import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lab/app/features/Home/cat.dart';
import 'package:lab/app/features/Home/cat_detail_screen.dart';
import 'package:lab/app/features/Home/home_screen.dart';
import 'package:lab/di/di.dart';

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
      pageBuilder: (_, state) =>
          MaterialPage(key: state.pageKey, child: const HomeScreen() as Widget),
    ),
    GoRoute(
      path: '/cats/:id',
      pageBuilder: (_, state) {
        final cat = state.extra;
        return MaterialPage(
          key: state.pageKey,
          child: cat is Cat
              ? CatDetailScreen(cat: cat)
              : const Scaffold(body: Center(child: Text('Котик не найден'))),
        );
      },
    ),
  ],
);
