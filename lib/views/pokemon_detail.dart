import 'package:flutter/material.dart';
import 'package:flutter_finals/controllers/ability_controller.dart';
import 'package:flutter_finals/controllers/characteristics_controller.dart';
import 'package:flutter_finals/controllers/chain_controller.dart';
import 'package:flutter_finals/controllers/trigger_controller.dart';
import 'package:flutter_finals/helper/map_card_color.dart';
import 'package:flutter_finals/models/pokemon.dart';
import 'package:flutter_finals/models/types.dart';
import 'package:flutter_finals/views/tiles/ability_tile.dart';
import 'package:flutter_finals/views/tiles/description_tile.dart';
import 'package:flutter_finals/views/tiles/evolution_tile.dart';
import 'package:flutter_finals/views/tiles/others_tile.dart';
import 'package:flutter_finals/views/tiles/stats_tile.dart';
import 'package:flutter_finals/views/widgets/divider.dart';
import 'package:flutter_finals/views/widgets/poke_id_type.dart';
import 'package:flutter_finals/views/widgets/sprite_image.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class PokemonDetail extends StatefulWidget {
  final PokemonMaster pokemon;
  final Types types_master;
  PokemonDetail(this.pokemon, this.types_master);

  @override
  _PokemonDetailState createState() => _PokemonDetailState();
}

class _PokemonDetailState extends State<PokemonDetail> {
  @override
  Widget build(BuildContext context) {
    final CharacteristicsController characteristicsController =
        Get.put(CharacteristicsController());
    final AbilityController abilityController = Get.put(AbilityController());
    final PokemonChain chain = Get.put(PokemonChain(widget.pokemon.id));

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pokemon.name.toUpperCase()),
        centerTitle: true,
      ),
      body: ListView(
        physics: ScrollPhysics(),
        children: [
          SpriteImage(widget.pokemon),
          SizedBox(height: 20),
          PokeIdType(widget.pokemon, widget.types_master),
          SizedBox(height: 30),
          CatDivider('Stats'),
          Obx(
            () => Container(
              height: MediaQuery.of(context).size.height * 0.28,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListView.builder(
                    itemCount: characteristicsController.statList.length,
                    itemBuilder: (BuildContext context, index) {
                      return StatsTile(
                        characteristicsController.statList[index],
                        index,
                      );
                    }),
              ),
            ),
          ),
          CatDivider('Description'),
          Obx(
            () => Container(
              height: MediaQuery.of(context).size.height * 0.2,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListView.builder(
                    itemCount: characteristicsController.descList.length,
                    itemBuilder: (BuildContext context, index) {
                      return DescriptionTile(
                        characteristicsController.descList[index],
                        index,
                      );
                    }),
              ),
            ),
          ),
          SizedBox(height: 10),
          CatDivider('Abilities'),
          Obx(
            () => Container(
              height: MediaQuery.of(context).size.height * 0.2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: StaggeredGridView.countBuilder(
                  crossAxisCount: 2,
                  itemCount: abilityController.abilityList.length,
                  itemBuilder: (context, index) {
                    return AbilityTile(
                        abilityController.abilityList[index], index);
                  },
                  staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          CatDivider('Others'),
          Obx(
            () => Container(
              height: MediaQuery.of(context).size.height * 0.28,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: StaggeredGridView.countBuilder(
                  crossAxisCount: 2,
                  itemCount: abilityController.textEntryList.length,
                  itemBuilder: (context, index) {
                    return OthersTile(
                        abilityController.textEntryList[index], index);
                  },
                  staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                ),
              ),
            ),
          ),
          SizedBox(height: 50),
          CatDivider('Evolution'),
          Obx(
            () => Container(
              height: MediaQuery.of(context).size.height * 0.2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: StaggeredGridView.countBuilder(
                  crossAxisCount: 2,
                  itemCount: chain.evo_chain.value.chain.evolvesTo.length,
                  itemBuilder: (context, index) {
                    return chainTile(chain.evo_chain.value.chain.evolvesTo[index],
                        );
                  },
                  staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
