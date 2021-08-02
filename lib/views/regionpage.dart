import 'package:flutter/material.dart';
import 'package:flutter_finals/controllers/region_controller.dart';
import 'package:flutter_finals/views/bottom_nav.dart';
import 'package:flutter_finals/views/tiles/region_tile.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';

class RegionPage extends StatelessWidget {
  final Regions regionController = Get.put(Regions());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[400],
        title: Text('Regions'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() => StaggeredGridView.countBuilder(
                  crossAxisCount: 2,
                  itemCount: regionController.regionlistlist.length,
                  itemBuilder: (context, index) {
                    return RegionTile(regionController.regionlistlist[index]);
                  },
                  staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                )),
          ),
        ],
      ),
      bottomNavigationBar: BottomNav(2),
    );
  }
}
