import 'package:flutter/material.dart';
import 'package:flutter_finals/views/evolutionspage.dart';
import 'package:flutter_finals/views/homepage.dart';
import 'package:flutter_finals/views/regionpage.dart';
import 'package:get/get.dart';

class BottomNav extends StatelessWidget {
  final int index;

  const BottomNav(this.index);

  @override
  Widget build(BuildContext context) {
    int index1 = index;
    return BottomNavigationBar(
      currentIndex: index1,
      onTap: (index1) {
        if (index1 == 0) {
          Get.off(() => HomePage());
        } else if (index1 == 1) {
          Get.off(() => EvoPage());
        } else if (index1 == 2) {
          Get.off(() => RegionPage());
        }
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.multiple_stop),
          label: 'Types',
          backgroundColor: Colors.red,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.school),
          label: 'Evolution',
          backgroundColor: Colors.green,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.location_on),
          label: 'Regions',
          backgroundColor: Colors.purple,
        ),
      ],
    );
  }
}
