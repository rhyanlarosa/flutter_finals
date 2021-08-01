import 'package:flutter/material.dart';
import 'package:flutter_finals/models/evolutionchain.dart';
import 'package:flutter_finals/models/evolutiontrigger.dart';

class chainTile extends StatelessWidget {
  final EvolvesTo evolve;

  const chainTile( this.evolve);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Text(
          evolve.species.name,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 17,
          ),
        ),
      ),
    );
  }
}