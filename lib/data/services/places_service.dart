import 'package:kasado/model/kasado_location/kasado_location.dart';
import 'package:flutter_google_places_sdk/flutter_google_places_sdk.dart';

const googleApiKey = "AIzaSyDN3zQFHS9fHxVZEEO_uDoc-xjw_WuDPXU";

class PlacesService {
  PlacesService._();
  static final instance = PlacesService._();
  final _placesApi = FlutterGooglePlacesSdk(googleApiKey);

  /// Returns a list of maps containing the "id" (placeId) of the suggestion
  /// and the "address" containing the description of the suggestion
  Future<List<Map<String, String?>>> getAutocompleteSuggestions(
      String query) async {
    if (query.isEmpty) return [];
    final apiResponse = await _placesApi.findAutocompletePredictions(query);
    final List<AutocompletePrediction> predictions = apiResponse.predictions;

    return (predictions.isNotEmpty)
        ? predictions
            .map((p) => {
                  "id": p.placeId,
                  "address": p.fullText,
                })
            .toList()
        : [];
  }

  Future<KasadoLocation?> getLocFromPlaceId(String placeId) async {
    final apiResponse = await _placesApi.fetchPlace(placeId, fields: [
      PlaceField.Name,
      PlaceField.Location,
    ]);
    final placeDetails = apiResponse.place;
    final latitude = placeDetails?.latLng?.lat;
    final longitude = placeDetails?.latLng?.lng;

    return (latitude != null && longitude != null)
        ? KasadoLocation(lat: latitude, lng: longitude)
        : null;
  }
}
