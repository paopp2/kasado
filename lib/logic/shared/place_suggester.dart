import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/data/services/places_service.dart';
import 'package:kasado/model/kasado_location/kasado_location.dart';

final placeSuggesterProvider = Provider.autoDispose(
  (ref) => PlaceSuggester(read: ref.read),
);

class PlaceSuggester {
  PlaceSuggester({
    required this.read,
  });
  final Reader read;
  final _placesService = PlacesService.instance;

  /// Used to store all autocomplete suggestion Maps in order to obtain the "id"
  /// from "address"
  List<Map<String, String?>> _autocompleteSuggestionMaps = [];

  Future<KasadoLocation?> getLocation(String suggestedAddress) async {
    final pickedSuggestionMap = _autocompleteSuggestionMaps.firstWhere(
      (s) => s["address"] == suggestedAddress,
    );
    final placeId = pickedSuggestionMap["id"] as String;

    return await _placesService.getLocFromPlaceId(placeId);
  }

  Future<List<String?>> getSuggestions(String? value) async {
    final suggestions =
        await _placesService.getAutocompleteSuggestions(value ?? '');
    _autocompleteSuggestionMaps = suggestions;

    return suggestions.map((s) => s["address"]).toList();
  }
}
