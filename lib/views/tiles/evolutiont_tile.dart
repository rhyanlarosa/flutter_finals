import 'dart:js';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_finals/models/evolutiontrigger.dart';
import 'package:flutter_finals/models/pokemon.dart';
import 'package:flutter_finals/views/lvlup.dart';
import 'package:get/get.dart';

class EvoTTile extends StatelessWidget {
  final Evolutiontrigger evolutionT;
  final PokemonMaster pokemon;
  EvoTTile(this.evolutionT, this.pokemon);

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
            Stack(
              children: [
                Container(
                  height: 100,
                  width: double.infinity,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
                  child: CachedNetworkImage(imageUrl: pokemon.sprites.frontDefault.toString(),
                  placeholder: (context, url) => SizedBox(
                    height: 100,
                    width: double.infinity,
                    child: CircularProgressIndicator()
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),)
                )
              ],
            ),
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
