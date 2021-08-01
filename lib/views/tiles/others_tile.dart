import 'package:flutter/material.dart';
import 'package:flutter_finals/models/ability.dart';

class OthersTile extends StatelessWidget {
  final Ability ability;
  final int index;
  OthersTile(this.ability, this.index);

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
          ability.flavorTextEntries[index].flavorText,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 17,
          ),
        ),
      ),
    );
  }
}
