import 'package:flutter/material.dart';
import 'package:worldline/controllers/pois_controller.dart';

class PoisFilter extends StatelessWidget {
  static final TextEditingController _poisFilterController =
      TextEditingController();

  const PoisFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0),
      child: TextField(
        controller: _poisFilterController,
        onChanged: (String? query) {
          PoisController.to.searchPoi(query);
        },
        decoration: InputDecoration(
          hintText: 'Type to search...',
          suffix: IconButton(
            onPressed: () {
              PoisController.to.searchPoi('');
              _poisFilterController.clear();
            },
            icon: const Icon(Icons.clear_rounded),
          ),
        ),
      ),
    );
  }
}
