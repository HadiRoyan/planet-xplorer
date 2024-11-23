import 'package:flutter/material.dart';

class PlanetCard extends StatelessWidget {
  const PlanetCard({required this.planetName, super.key});

  final String planetName;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white70,
      child: SizedBox(
        width: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(planetName),
            InkWell(
              onTap: () {},
              child: const Padding(
                padding: EdgeInsets.all(4.0),
                child: Text(
                  'Detail',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}