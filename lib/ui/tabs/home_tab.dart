import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planet_xplorer/core/constants/theme.dart';
import 'package:planet_xplorer/logic/blocs/fun_fact_bloc/fun_fact_bloc.dart';
import 'package:planet_xplorer/logic/blocs/planet_bloc/planet_bloc.dart';
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
          BlocConsumer<PlanetBloc, PlanetState>(
            listener: (context, state) {
              if (state is PlanetLoaded) {
                BlocProvider.of<FunFactBloc>(context).add(
                  LoadListFunFact(planetData: state.planetData),
                );
              }
            },
            builder: (context, state) {
              if (state is PlanetLoaded) {
                return Container(
                  height: 200,
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.planetModels.length,
                    addAutomaticKeepAlives: true,
                    itemBuilder: (context, index) {
                      return PlanetCard(
                        onTap: () {},
                        planet: state.planetModels[index],
                      );
                    },
                  ),
                );
              } else if (state is PlanetError) {
                return Center(
                  child: Text(state.message),
                );
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Fun Facts',
              style: TextStyle(fontSize: 24),
            ),
          ),
        ],
      ),
    );
  }
}
