import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:planet_xplorer/core/app/route_name.dart';

import '../../logic/cubit/tab_cubit.dart';
import '../tabs/home_tab.dart';
import '../tabs/profile_tab.dart';
import '../tabs/quiz_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _tabs = [
    const HomeTab(),
    const QuizTab(),
    const ProfileTab(),
  ];

  void _onItemTapped(int index) {
    context.read<TabCubit>().setTabIndex(index);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabCubit, int>(
      builder: (context, state) {
        return Scaffold(
          appBar: state == 2
              ? AppBar(
                  title: const Text('Profile'),
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blueAccent,
                  actions: [
                    IconButton(
                      icon: const Icon(Icons.settings),
                      onPressed: () => context.push(RouteName.setting.path),
                    ),
                  ],
                )
              : null,
          body: SafeArea(
            child: _tabs[state],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: state,
            onTap: _onItemTapped,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.quiz),
                label: 'Quiz',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),
                label: 'Profile',
              ),
            ],
          ),
        );
      },
    );
  }
}
