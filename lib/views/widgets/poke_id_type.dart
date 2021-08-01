import 'package:flutter/material.dart';
import 'package:flutter_finals/helper/map_card_color.dart';
import 'package:flutter_finals/models/pokemon.dart';
import 'package:flutter_finals/models/types.dart';

class PokeIdType extends StatelessWidget {
  final PokemonMaster pokemon;
  final Types types_master;
  PokeIdType(this.pokemon, this.types_master);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: Text(
            '#' + '${pokemon.id}',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(width: 10),
        Container(
          decoration: BoxDecoration(
            color: setCardColor(types_master.name),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              types_master.name.toUpperCase(),
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
