import 'dart:convert';

import 'package:http/http.dart' as http;

/// A service class to interact with the POIs API.
class PoisService {
  static const String _apiUrl =
      'https://raw.githubusercontent.com/worldline-spain/technical_test_backend/main/pois.json';

  PoisService._();

  /// Fetches a list of POIs from the API.
  ///
  /// Returns a [Future] that completes with the list of POIs.
  ///
  /// Throws an [Exception] if the request is unsuccessful.
  static Future<dynamic> fetchAllPois() async {
    final Uri poisUri = Uri.parse(_apiUrl);

    try {
      final http.Response response = await http.get(poisUri);

      if (response.statusCode == 200) {
        return jsonDecode(response.body)['list'];
      } else {
        throw 'Failed to load pois. Status code: ${response.statusCode}';
      }
    } catch (error) {
      throw Exception(error);
    }
  }
}
