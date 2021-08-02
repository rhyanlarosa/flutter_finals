import 'package:flutter/material.dart';
import 'package:flutter_finals/models/regions.dart';
import 'package:flutter_finals/views/region_detail.dart';
import 'package:get/get.dart';

class RegionTile extends StatelessWidget {
  final Region region;
  RegionTile(this.region);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => LocationDetail(region.locations, region.name));
      },
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                region.name.toUpperCase(),
                maxLines: 2,
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
