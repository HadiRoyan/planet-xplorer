import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:planet_xplorer/data/provider/planet_provider.dart';
import 'package:planet_xplorer/data/repository/planet_repository.dart';
import 'package:planet_xplorer/logic/blocs/planet_bloc/planet_bloc.dart';
import 'package:planet_xplorer/logic/cubit/tab_cubit.dart';
import 'package:planet_xplorer/ui/pages/setting_page.dart';

import '../../ui/pages/home_page.dart';
import 'route_name.dart';

final GoRouter router = GoRouter(
  initialLocation: RouteName.home.path,
  routes: [
    // Define HomePage route
    GoRoute(
      path: RouteName.home.path,
      builder: (BuildContext context, GoRouterState state) {
        // return BlocProvider(
        //   create: (context) => TabCubit(),
        //   child: const HomePage(),
        // );
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => TabCubit(),
            ),
            BlocProvider(
              create: (context) => PlanetBloc(
                planetRepository: PlanetRepository(
                  planetProvider: PlanetProvider(),
                ),
              )..add(LoadPlanetEvent()),
            ),
          ],
          child: const HomePage(),
        );
      },
    ),

    // Define Setting route
    GoRoute(
      path: RouteName.setting.path,
      builder: (BuildContext context, GoRouterState state) {
        return const SettingPage();
      },
    ),

    // Define other routes, if needed
  ],
);
