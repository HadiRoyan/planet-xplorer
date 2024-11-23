import 'package:flutter/material.dart';
import 'package:planet_xplorer/core/constants/theme.dart';

class QuizTab extends StatelessWidget {
  const QuizTab({super.key});

  @override
  Widget build(BuildContext context) {
    
    AppTheme.lightStatusBar();
    return const Center(
      child: Text('Explore Tab'),
    );
  }
}