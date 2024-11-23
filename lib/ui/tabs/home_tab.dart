import 'package:flutter/material.dart';
import 'package:planet_xplorer/core/constants/theme.dart';
import 'package:planet_xplorer/ui/components/banner_image.dart';
import 'package:planet_xplorer/ui/components/planet_card.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    AppTheme.darkStatusBar();

    return SingleChildScrollView(
      child: Column(
        children: [
          const BannerImage(),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Planet',
              style: TextStyle(fontSize: 24),
            ),
          ),
          Container(
            height: 200,
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 9,
              itemBuilder: (context, index) {
                return const PlanetCard(
                  planetName: 'Earth',
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
