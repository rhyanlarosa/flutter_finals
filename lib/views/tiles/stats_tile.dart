import 'package:flutter/material.dart';
import 'package:flutter_finals/models/characteristics.dart';

class StatsTile extends StatelessWidget {
  final Characteristics character;
  final int index;
  StatsTile(this.character, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 3, horizontal: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Text(
              '${character.highestStat.name.toUpperCase()}',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(width: 20),
          Container(
            child: Text(
              '${character.possibleValues[index]}',
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
