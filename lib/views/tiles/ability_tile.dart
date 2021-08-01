import 'package:flutter/material.dart';
import 'package:flutter_finals/models/ability.dart';

class AbilityTile extends StatelessWidget {
  final Ability ability;
  final int index;
  AbilityTile(this.ability, this.index);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      color: Colors.blueGrey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Text(
          ability.name,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 17,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
