import 'package:flutter/material.dart';
import 'package:flutter_finals/models/evolutiontrigger.dart';
import 'package:get/get.dart';

import '../lvlup.dart';

class EvoTTile extends StatelessWidget {
  final Evolutiontrigger evolutionT;
  EvoTTile(this.evolutionT);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => levelUp(evolutionT.pokemonSpecies, evolutionT.name));
      },
    child: Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              evolutionT.name.toUpperCase(),
              maxLines: 2,
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    ),
    );
  }
}
