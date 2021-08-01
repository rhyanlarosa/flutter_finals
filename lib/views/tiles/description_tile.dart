import 'package:flutter/material.dart';
import 'package:flutter_finals/models/characteristics.dart';

class DescriptionTile extends StatelessWidget {
  final Characteristics character;
  final int index;
  DescriptionTile(this.character, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 14),
      child: Column(
        children: [
          Container(
            child: Text(
              '${character.descriptions[index].description}',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Container(
            child: Text(
              '${character.descriptions[index].language.name.toString()}',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
