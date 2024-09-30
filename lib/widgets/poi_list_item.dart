import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:worldline/models/poi.dart';
import 'package:worldline/views/poi_detail.dart';

class PoiListItem extends StatelessWidget {
  final Poi poi;

  const PoiListItem({
    super.key,
    required this.poi,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Get.to(() => PoiDetail(poi: poi)),
      title: Text(poi.title),
      trailing: const Icon(
        Icons.arrow_forward_ios_rounded,
        size: 16.0,
        color: Colors.black26,
      ),
    );
  }
}
