import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_finals/controllers/chain_controller.dart';
import 'package:flutter_finals/controllers/types_controller.dart';
import 'package:flutter_finals/views/tiles/evolution_tile.dart';
import 'package:flutter_finals/views/tiles/types_tile.dart';
import 'package:flutter_finals/views/typepage.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';

class HomePage extends StatelessWidget {

  _onTap(int index) {
    Navigator.of(context).push(MaterialPageRoute<Null>(builder: (BuildContext context)
    {
      return _children[_currentIndex];
    }));
  }
  final List<Widget> _children = [
    TypePage(),
    chainTile(),
  ];

  int _currentIndex = 0;

  final TypesController typesController = Get.put(TypesController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[400],
        title: Text('Types'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() => StaggeredGridView.countBuilder(
                  crossAxisCount: 2,
                  itemCount: typesController.typeList.length,
                  itemBuilder: (context, index) {
                    return TypesTile(typesController.typeList[index]);
                  },
                  staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                )),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/pokeball.png'),),
            title: new Text('Types'),
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/pokeball.png'),),
            title: Text('Evolution'),
          ),
        ],
      ),
    );
  }
}
