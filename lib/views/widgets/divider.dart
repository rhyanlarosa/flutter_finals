import 'package:flutter/material.dart';

class CatDivider extends StatelessWidget {
  final String str;
  CatDivider(this.str);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Text(
            str,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Divider(
          color: Colors.black45,
          height: 12,
          thickness: 2,
          indent: 30,
          endIndent: 30,
        ),
      ],
    );
  }
}
