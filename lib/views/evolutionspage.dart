import 'package:flutter/material.dart';
import 'package:flutter_finals/controllers/trigger_controller.dart';
import 'package:flutter_finals/views/bottom_nav.dart';
import 'package:flutter_finals/views/tiles/evolutiont_tile.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';

class EvoPage extends StatelessWidget {
  final PokemonTrigger triggerController = Get.put(PokemonTrigger());
  @override
  Widget build(BuildContext context) {
    print(triggerController.triggerlist.length);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[400],
        title: Text('Evolution Triggers'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() => StaggeredGridView.countBuilder(
                  crossAxisCount: 2,
                  itemCount: triggerController.triggerlist.length,
                  itemBuilder: (context, index) {
                    return EvoTTile(triggerController.triggerlist[index]);
                  },
                  staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                )),
          ),
        ],
      ),
      bottomNavigationBar: BottomNav(1),
    );
  }
}
