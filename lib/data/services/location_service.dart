import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kasado/model/kasado_location/kasado_location.dart';

final locationServiceProvider =
    Provider.autoDispose((ref) => LocationService(ref.read));

class LocationService {
  LocationService(this.read);

  final Reader read;
  final serviceStatusController = StreamController<ServiceStatus>();
  final permissionStatusController =
      StreamController<LocationPermission>.broadcast();

  Future<Either<Exception, KasadoLocation>> getLocation() async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) Geolocator.openAppSettings();
    final locPermission = await Geolocator.checkPermission();
    if (locPermission == LocationPermission.denied) {
      await Geolocator.requestPermission();
    }
    try {
      final position = await Geolocator.getCurrentPosition();

      return Right(KasadoLocation(
        lat: position.latitude,
        lng: position.longitude,
      ));
    } catch (e) {
      e as Exception;
      switch (e.runtimeType) {
        case LocationServiceDisabledException:
          serviceStatusController.add(ServiceStatus.disabled);
          break;
        case PermissionDeniedException:
          permissionStatusController.add(LocationPermission.denied);
          break;
      }

      return Left(e);
    }
  }
}
