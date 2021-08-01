import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_finals/helper/map_card_color.dart';
import 'package:flutter_finals/models/pokemon.dart';
import 'package:flutter_finals/models/types.dart';

class SpriteImage extends StatelessWidget {
  final PokemonMaster pokemon;
  final Types types_master;
  SpriteImage(this.pokemon, this.types_master);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 200,
          width: double.infinity,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(1),
            color: setCardColor(types_master.name).withOpacity(0.5),
          ),
          child: CachedNetworkImage(
            imageUrl: pokemon.sprites.frontDefault.toString(),
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
      ],
    );
  }
}
