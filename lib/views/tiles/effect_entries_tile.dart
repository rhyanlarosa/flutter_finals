import 'package:flutter/material.dart';
import 'package:flutter_finals/models/ability.dart';

class EffectEntriesTile extends StatelessWidget {
  final Ability ability;
  final int index;
  EffectEntriesTile(this.ability, this.index);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      color: Colors.blueGrey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Text(
          ability.effectEntries[index].effect,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
