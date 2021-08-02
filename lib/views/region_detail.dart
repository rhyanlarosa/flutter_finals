import 'package:flutter/material.dart';
import 'package:flutter_finals/models/regions.dart';
import 'package:flutter_finals/views/tiles/locations_tile.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class LocationDetail extends StatelessWidget {
  final String regionname;
  final List<MainGeneration> chosen_region;
  LocationDetail(this.chosen_region, this.regionname);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[400],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    regionname.toUpperCase(),
                    style:
                        TextStyle(fontSize: 32.0, fontWeight: FontWeight.w900),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: StaggeredGridView.countBuilder(
            crossAxisCount: 2,
            itemCount: chosen_region.length,
            itemBuilder: (context, index) {
              return LocationTile(chosen_region[index]);
            },
            staggeredTileBuilder: (index) => StaggeredTile.fit(1),
          )),
        ],
      ),
    );
  }
}
