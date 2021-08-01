import 'package:flutter/material.dart';
import 'package:flutter_finals/models/characteristics.dart';

class DescTile extends StatelessWidget {
  final Characteristics character;
  DescTile(this.character);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 14),
      child: Container(
        child: Text(
          'DESCRIPTION',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
