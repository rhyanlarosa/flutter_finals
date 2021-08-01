import 'package:flutter/material.dart';
import 'package:flutter_finals/helper/map_card_color.dart';
import 'package:flutter_finals/models/ability.dart';
import 'package:flutter_finals/models/types.dart';

class AbilityTile extends StatelessWidget {
  final Ability ability;
  final int index;
  final Types types_master;
  AbilityTile(this.ability, this.index, this.types_master);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      color: setCardColor(types_master.name),
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
          ),
        ),
      ),
    );
  }
}
