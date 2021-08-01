import 'package:flutter/material.dart';
import 'package:flutter_finals/models/pokemon.dart';

class StatsTile extends StatelessWidget {
  final PokemonMaster character;
  final int attackType;
  StatsTile(this.character, this.attackType);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 3, horizontal: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Text(
              '${character.stats[attackType].stat.name.toUpperCase()}',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(width: 20),
          Container(
            child: Text(
              '${character.stats[attackType].baseStat}',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
