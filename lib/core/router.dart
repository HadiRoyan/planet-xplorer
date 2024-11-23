import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:planet_xplorer/logic/cubit/tab_cubit.dart';
import 'package:planet_xplorer/ui/pages/setting_page.dart';

import '../ui/pages/home_page.dart';

enum AppRoute {
  home('/'),
  setting('/setting');

  const AppRoute(this.path);
  final String path;
}

final GoRouter router = GoRouter(
  initialLocation: AppRoute.home.path,
  routes: [
    // Define HomePage route
    GoRoute(
      path: AppRoute.home.path,
      builder: (BuildContext context, GoRouterState state) {
        return BlocProvider(
          create: (context) => TabCubit(),
          child: const HomePage(),
        );
      },
    ),

    // Define Setting route
    GoRoute(
      path: AppRoute.setting.path,
      builder: (BuildContext context, GoRouterState state) {
        return const SettingPage();
      },
    ),

    // Define other routes, if needed
  ],
);
