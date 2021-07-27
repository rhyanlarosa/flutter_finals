import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_finals/models/teams.dart';

class TeamsTile extends StatelessWidget {
  final Datum teams;
  const TeamsTile(this.teams);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 180,
                  width: double.infinity,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Image.network(
                    "http://i.cdn.turner.com/nba/nba/.element/img/1.0/teamsites/logos/teamlogos_500x500/${teams.abbreviation.toLowerCase()}.png",
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  height: 180,
                  width: double.infinity,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              teams.city,
              maxLines: 2,
              style: TextStyle(fontWeight: FontWeight.w800),
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 8),
            Text(teams.name, style: TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}
