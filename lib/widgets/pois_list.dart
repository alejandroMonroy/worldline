import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/state_manager.dart';
import 'package:worldline/controllers/pois_controller.dart';
import 'package:worldline/widgets/poi_list_item.dart';

class PoisList extends StatelessWidget {
  const PoisList({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PoisController>(
      init: Get.put(PoisController()),
      builder: (controller) {
        return ListView.separated(
          itemBuilder: (context, index) =>
              PoiListItem(poi: controller.filteredPois[index]),
          separatorBuilder: (context, index) => const Divider(),
          itemCount: controller.filteredPois.length,
        );
      },
    );
  }
}
