import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/constants/extensions/string_extensions.dart';
import 'package:kasado/constants/extensions/tec_extensions.dart';
import 'package:kasado/data/core/core_providers.dart';
import 'package:kasado/logic/shared/place_suggester.dart';
import 'package:kasado/model/kasado_location/kasado_location.dart';

final searchTextControllerProvider = Provider(
  (ref) => TextEditingController(text: "Retrieving current location..."),
);

class PlaceSearchField extends HookConsumerWidget {
  const PlaceSearchField({
    Key? key,
    required this.constraints,
    this.initialPlace,
    this.onLocationTapped,
  }) : super(key: key);

  final KasadoLocation? initialPlace;
  final BoxConstraints constraints;
  final void Function(KasadoLocation? location)? onLocationTapped;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchTextController = ref.watch(searchTextControllerProvider);
    final placeSuggester = ref.watch(placeSuggesterProvider);

    useEffect(() {
      // Asynchronously update searchTextController.text to avoid rebuild clashes/errors
      // ignore: prefer-extracting-callbacks
      Future.delayed(Duration.zero, () {
        searchTextController.text = initialPlace?.address ?? '';
      });

      return;
    }, []);

    Future<void> _onSuggestionSelected(String? suggestedPlace) async {
      if (suggestedPlace != null) {
        ref.read(searchTextControllerProvider).text = suggestedPlace;
        final location = await placeSuggester.getLocation(suggestedPlace);
        onLocationTapped?.call(location?.copyWith(address: suggestedPlace));
        ref.read(mixpanel)!.track(
              "Searched for a location",
              properties: location?.toJson(),
            );
      }
    }

    Future<Iterable<String?>> _suggestionsCallback(String pattern) async {
      return await placeSuggester.getSuggestions(pattern);
    }

    return TypeAheadField<String?>(
      animationStart: 0.75,
      itemBuilder: (context, itemData) {
        final suggestion = itemData.toString();
        final suggestionSplit = suggestion.splitAddress();

        return ListTile(
          title: Text(
            suggestionSplit.first,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: Text(
            suggestionSplit.last,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 13),
          ),
        );
      },
      onSuggestionSelected: _onSuggestionSelected,
      suggestionsCallback: _suggestionsCallback,
      debounceDuration: const Duration(milliseconds: 500),
      suggestionsBoxDecoration: SuggestionsBoxDecoration(
        borderRadius: BorderRadius.circular(10),
        constraints: BoxConstraints(maxWidth: constraints.maxWidth),
        elevation: 15,
      ),
      textFieldConfiguration: TextFieldConfiguration(
        controller: searchTextController,
        onTap: searchTextController.selectText,
        decoration: InputDecoration(
          hintText: "Search places",
          fillColor: Colors.grey.shade100,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          prefixIcon: const Icon(
            Icons.location_on_rounded,
            color: Colors.black,
          ),
        ),
      ),
      hideOnEmpty: true,
    );
  }
}
