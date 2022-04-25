import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'kasado_location.freezed.dart';
part 'kasado_location.g.dart';

@freezed
class KasadoLocation with _$KasadoLocation {
  const factory KasadoLocation({
    required double lat,
    required double lng,
    String? address,
  }) = _KasadoLocation;

  factory KasadoLocation.fromJson(Map<String, dynamic> json) =>
      _$KasadoLocationFromJson(json);
}
