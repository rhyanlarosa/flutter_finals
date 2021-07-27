import 'package:flutter/material.dart';
import 'package:flutter_finals/controllers/teams_controller.dart';
import 'package:flutter_finals/views/teams_tile.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';

class HomePage extends StatelessWidget {
  final TeamsController teamsController = Get.put(TeamsController());
  @override
  Widget build(BuildContext context) {
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
                    'Teams',
                    style:
                        TextStyle(fontSize: 32.0, fontWeight: FontWeight.w900),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(() => StaggeredGridView.countBuilder(
                  crossAxisCount: 2,
                  itemCount: teamsController.teamsList.length,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  itemBuilder: (context, index) {
                    return TeamsTile(teamsController.teamsList[index]);
                  },
                  staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                )),
          ),
        ],
      ),
    );
  }
}
