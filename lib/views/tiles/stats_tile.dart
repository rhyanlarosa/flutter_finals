import 'package:flutter/material.dart';
import 'package:flutter_finals/models/characteristics.dart';

class StatsTile extends StatelessWidget {
  final Characteristics character;
  StatsTile(this.character);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 14),
      child: Row(
        children: [
          Container(
            child: Text(
              '${character.highestStat.name.toUpperCase()}',
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
