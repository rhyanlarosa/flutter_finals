import 'package:flutter/material.dart';
import 'package:flutter_finals/models/types.dart';
import 'package:flutter_finals/views/typepage.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';

class TypesTile extends StatelessWidget {
  final Types types_master;
  const TypesTile(this.types_master);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => TypePage(types_master));
      },
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: 180,
                    width: double.infinity,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Image(
                      image: AssetImage('assets/${types_master.name}.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                    height: 180,
                    width: double.infinity,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Text(
                types_master.name.toUpperCase(),
                maxLines: 2,
                style: TextStyle(fontWeight: FontWeight.w800),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
