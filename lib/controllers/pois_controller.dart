import 'package:get/get.dart';
import 'package:worldline/models/poi.dart';
import 'package:worldline/services/pois_service.dart';
import 'package:worldline/services/sqflite_service.dart';

class PoisController extends GetxController {
  bool isLoadingPois = false;
  List<Poi> pois = [];
  List<Poi> filteredPois = [];

  static PoisController get to => Get.find();

  @override
  void onInit() {
    super.onInit();
    getAllPois();
  }

  Future<void> getAllPois({bool mustRefetch = false}) async {
    if (!mustRefetch) {
      isLoadingPois = true;
      update();
    }
    final List<Map<String, Object?>> data =
        await SqfliteService.retrieve('pois');
    List<Poi> pois =
        data.map((element) => Poi.fromJson(Map.from(element))).toList();

    if (pois.isEmpty || mustRefetch) {
      try {
        final poisMap = await PoisService.fetchAllPois();
        pois = List<Poi>.from(
            poisMap.map((poiMap) => Poi.fromJson(poiMap as Map)));
        for (var poi in pois) {
          await SqfliteService.insert(poi.toMap());
        }
      } on Exception catch (e) {
        Get.snackbar('Error', e.toString());
      }
    }

    this.pois = pois;
    filteredPois = pois;
    isLoadingPois = false;
    update();
  }

  void searchPoi(String? query) {
    final List<Poi> filteredPois = pois
        .where((poi) => poi.title.toLowerCase().contains(query!.toLowerCase()))
        .toList();
    this.filteredPois = filteredPois;
    update();
  }
}
