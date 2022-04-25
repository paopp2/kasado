import 'package:google_place/google_place.dart';
import 'package:kasado/model/kasado_location/kasado_location.dart';
import 'package:universal_platform/universal_platform.dart';

const googleApiKey = "AIzaSyDN3zQFHS9fHxVZEEO_uDoc-xjw_WuDPXU";

class PlacesService {
  PlacesService._();
  static final instance = PlacesService._();

  /// Returns a list of maps containing the "id" (placeId) of the suggestion
  /// and the "address" containing the description of the suggestion
  Future<List<Map<String, String?>>> getAutocompleteSuggestions(
      String query) async {
    if (query.isEmpty) return [];
    final googlePlace = GooglePlace(
      googleApiKey,
      proxyUrl: UniversalPlatform.isWeb
          ? "https://kasado-2022-cors-proxy.herokuapp.com/"
          : null,
    );
    final result = await googlePlace.autocomplete.get(query);
    final predictions = result?.predictions ?? [];

    return (predictions.isNotEmpty)
        ? predictions
            .map((p) => {
                  "id": p.placeId,
                  "address": p.description,
                })
            .toList()
        : [];
  }

  Future<KasadoLocation?> getLocFromPlaceId(String placeId) async {
    final googlePlace = GooglePlace(
      googleApiKey,
      proxyUrl: UniversalPlatform.isWeb
          ? "https://kasado-2022-cors-proxy.herokuapp.com/"
          : null,
    );
    final response = await googlePlace.details.get(placeId);
    final latitude = response?.result?.geometry?.location?.lat;
    final longitude = response?.result?.geometry?.location?.lng;

    return (latitude != null && longitude != null)
        ? KasadoLocation(lat: latitude, lng: longitude)
        : null;
  }
}
