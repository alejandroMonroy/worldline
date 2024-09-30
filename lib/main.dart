import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:worldline/services/sqflite_service.dart';
import 'package:worldline/views/all_pois.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SqfliteService.initDatabase();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: AllPois(),
      defaultTransition: Transition.noTransition,
    );
  }
}
