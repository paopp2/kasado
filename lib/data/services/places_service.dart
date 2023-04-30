import 'dart:convert';

import 'package:kasado/model/kasado_location/kasado_location.dart';
import 'package:http/http.dart' as http;

const googleApiKey = "AIzaSyDN3zQFHS9fHxVZEEO_uDoc-xjw_WuDPXU";

class PlacesService {
  PlacesService._();
  static final instance = PlacesService._();

  /// Returns a list of maps containing the "id" (placeId) of the suggestion
  /// and the "address" containing the description of the suggestion
  Future<List<Map<String, String?>>> getAutocompleteSuggestions(
      String query) async {
    if (query.isEmpty) return [];
    final predictionsJson = await _getPlacePredictions(query);

    return (predictionsJson.isNotEmpty)
        ? predictionsJson
            .map((p) => {
                  "id": p['place_id'] as String,
                  "address": p['description'] as String,
                })
            .toList()
        : [];
  }

  Future<KasadoLocation?> getLocFromPlaceId(String placeId) async {
    final placeDetailsJson = await _getPlaceDetails(placeId: placeId);
    final latitude = placeDetailsJson['geometry']?['location']?['lat'];
    final longitude = placeDetailsJson['geometry']?['location']?['lng'];

    return (latitude != null && longitude != null)
        ? KasadoLocation(lat: latitude, lng: longitude)
        : null;
  }

  Future<List<dynamic>> _getPlacePredictions(String query) async {
    final res = await http.get(Uri.parse(
      'https://maps.googleapis.com/maps/api/place/queryautocomplete/json'
      '?input=${Uri.decodeFull(query)}'
      '&key=$googleApiKey',
    ));

    return jsonDecode(res.body)['predictions']?.toList();
  }

  Future<dynamic> _getPlaceDetails({
    required String placeId,
    List<String> fields = const ['name', 'geometry'],
  }) async {
    final res = await http.get(Uri.parse(
      "https://maps.googleapis.com/maps/api/place/details/json"
      "?fields=${Uri.decodeFull(fields.join(','))}"
      "&place_id=$placeId"
      "&key=$googleApiKey",
    ));

    return jsonDecode(res.body)['result'];
  }
}
