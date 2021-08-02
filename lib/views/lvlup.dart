import 'package:flutter/material.dart';
import 'package:flutter_finals/controllers/trigger_controller.dart';
import 'package:flutter_finals/models/evolutiontrigger.dart';
import 'package:flutter_finals/views/tiles/level_up_tile.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class levelUp extends StatelessWidget {
  final String trigger;
  final List<PokemonSpecy> names;
  levelUp(this.names, this.trigger);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[400],
        title: Text(trigger.toUpperCase()),
      ),
      body: Column(
        children: [
          Expanded(
            child: StaggeredGridView.countBuilder(
              crossAxisCount: 2,
              itemCount: names.length,
              itemBuilder: (context, index) {
                return lvlupTile(names[index]);
              },
              staggeredTileBuilder: (index) => StaggeredTile.fit(1),
            ))
        ],
      )
    );
  }
}