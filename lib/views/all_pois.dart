import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:worldline/controllers/pois_controller.dart';
import 'package:worldline/widgets/loader.dart';
import 'package:worldline/widgets/pois_filter.dart';
import 'package:worldline/widgets/pois_list.dart';
import 'package:worldline/widgets/pois_placeholder.dart';

class AllPois extends StatelessWidget {
  const AllPois({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('All Pois')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const PoisFilter(),
            const SizedBox(height: 16.0),
            Expanded(
              child: RefreshIndicator.adaptive(
                strokeWidth: 0.0,
                onRefresh: () =>
                    PoisController.to.getAllPois(mustRefetch: true),
                child: GetBuilder<PoisController>(
                  init: Get.put(PoisController()),
                  builder: (controller) {
                    if (controller.isLoadingPois) {
                      return const Loader();
                    }

                    if (controller.filteredPois.isEmpty) {
                      return const PoisPlaceholder();
                    }

                    return const PoisList();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
