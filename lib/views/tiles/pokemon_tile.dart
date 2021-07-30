import 'package:flutter/material.dart';
import 'package:flutter_finals/models/pokemon.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PokemonTile extends StatelessWidget {
  final PokemonMaster pokemon;
  const PokemonTile(this.pokemon);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 180,
                  width: double.infinity,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: pokemon.sprites.frontDefault.toString(),
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              pokemon.name.toUpperCase(),
              maxLines: 2,
              style: TextStyle(fontWeight: FontWeight.w800),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
