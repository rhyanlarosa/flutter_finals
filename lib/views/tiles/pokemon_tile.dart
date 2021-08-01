import 'package:flutter/material.dart';
import 'package:flutter_finals/models/pokemon.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_finals/models/types.dart';
import 'package:flutter_finals/views/pokemon_detail.dart';
import 'package:get/get.dart';

class PokemonTile extends StatelessWidget {
  final Types chose_type;
  final PokemonMaster pokemon;
  const PokemonTile(this.chose_type, this.pokemon);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => PokemonDetail(pokemon, chose_type));
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
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: pokemon.sprites.frontDefault.toString(),
                      placeholder: (context, url) => SizedBox(
                          height: 100,
                          width: double.infinity,
                          child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Text(
                pokemon.name.toUpperCase(),
                maxLines: 2,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 8),
              Text(
                "#" + pokemon.id.toString(),
                maxLines: 2,
                style: TextStyle(fontWeight: FontWeight.w800),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
