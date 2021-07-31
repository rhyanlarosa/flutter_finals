import 'package:flutter/material.dart';
import 'package:flutter_finals/controllers/ability_controller.dart';
import 'package:flutter_finals/controllers/characteristics_controller.dart';
import 'package:flutter_finals/models/pokemon.dart';
import 'package:flutter_finals/models/types.dart';
import 'package:flutter_finals/views/tiles/ability_tile.dart';
import 'package:flutter_finals/views/tiles/description_tile.dart';
import 'package:flutter_finals/views/tiles/stats_tile.dart';
import 'package:flutter_finals/views/widgets/poke_id_type.dart';
import 'package:flutter_finals/views/widgets/sprite_image.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class PokemonDetail extends StatelessWidget {
  final PokemonMaster pokemon;
  final Types types_master;
  PokemonDetail(this.pokemon, this.types_master);

  Widget divider(String str) {
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
          indent: 20,
          endIndent: 20,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final CharacteristicsController characteristicsController =
        Get.put(CharacteristicsController());
    final AbilityController abilityController = Get.put(AbilityController());

    return Scaffold(
      appBar: AppBar(
        title: Text(pokemon.name.toUpperCase()),
        centerTitle: true,
      ),
      body: ListView(
        physics: ScrollPhysics(),
        children: [
          SpriteImage(pokemon),
          SizedBox(height: 10),
          PokeIdType(pokemon, types_master),
          SizedBox(height: 10),
          divider('About'),
          // Obx(
          //   () => Container(
          //     height: MediaQuery.of(context).size.height * 0.28,
          //     child: Padding(
          //       padding: const EdgeInsets.all(10.0),
          //       child: ListView.builder(
          //           itemCount:
          //               characteristicsController.characteristicsList.length,
          //           itemBuilder: (BuildContext context, index) {
          //             return DescTile(
          //               characteristicsController.characteristicsList[index],
          //             );
          //           }),
          //     ),
          //   ),
          // ),
          SizedBox(height: 10),
          divider('Stats'),
          Obx(
            () => Container(
              height: MediaQuery.of(context).size.height * 0.28,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListView.builder(
                    itemCount:
                        characteristicsController.characteristicsList.length,
                    itemBuilder: (BuildContext context, index) {
                      return StatsTile(
                        characteristicsController.characteristicsList[index],
                      );
                    }),
              ),
            ),
          ),
          SizedBox(height: 10),
          divider('Ability'),
          Obx(
            () => Container(
              height: MediaQuery.of(context).size.height * 0.28,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: StaggeredGridView.countBuilder(
                  crossAxisCount: 2,
                  itemCount: abilityController.abilityList.length,
                  itemBuilder: (context, index) {
                    return AbilityTile(
                      abilityController.abilityList[index],
                    );
                  },
                  staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
