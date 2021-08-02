import 'package:flutter/material.dart';
import 'package:flutter_finals/models/evolutiontrigger.dart';

class lvlupTile extends StatelessWidget {
  final PokemonSpecy specy;
  lvlupTile(this.specy);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              specy.name.toUpperCase(),
              maxLines: 2,
              style: TextStyle(fontWeight: FontWeight.w800),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        )
      ),
    );
  }
}