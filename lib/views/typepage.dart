import 'package:flutter/material.dart';
import 'package:flutter_finals/controllers/pokemon_controller.dart';
import 'package:flutter_finals/models/types.dart';
import 'package:flutter_finals/views/tiles/pokemon_tile.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class TypePage extends StatelessWidget {
  final Types chosen_type;
  TypePage(this.chosen_type);

  @override
  Widget build(BuildContext context) {
    final PokemonController typesController =
        Get.put(PokemonController(chosen_type.name, chosen_type.pokemon));
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    chosen_type.name.toUpperCase(),
                    style:
                        TextStyle(fontSize: 32.0, fontWeight: FontWeight.w900),
                  ),
                ),
              ],
            ),
          ),
          Obx(() => Expanded(
                  child: StaggeredGridView.countBuilder(
                crossAxisCount: 2,
                itemCount: typesController.pokelist.length,
                itemBuilder: (context, index) {
                  return PokemonTile(
                      chosen_type, typesController.pokelist[index]);
                },
                staggeredTileBuilder: (index) => StaggeredTile.fit(1),
              ))),
        ],
      ),
    );
  }
}
