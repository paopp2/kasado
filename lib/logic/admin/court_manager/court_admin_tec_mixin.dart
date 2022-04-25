import 'package:flutter/cupertino.dart';
import 'package:kasado/model/court/court.dart';
import 'package:kasado/model/court_sched/court_sched.dart';
import 'package:kasado/model/kasado_location/kasado_location.dart';

mixin CourtAdminTecMixin {
  final tecCourtName = TextEditingController();
  final tecCourtPhotoUrl = TextEditingController();
  final tecCourtAddress = TextEditingController();
  final tecTicketPrice = TextEditingController();
  final tecMaxPerSlot = TextEditingController();
  final tecMinPerSlot = TextEditingController();

  void clearAllTecs() {
    tecCourtName.clear();
    tecCourtPhotoUrl.clear();
    tecCourtAddress.clear();
    tecTicketPrice.clear();
    tecMaxPerSlot.clear();
    tecMinPerSlot.clear();
  }

  void setupCourtToEdit(
    Court court,
    void Function(
      KasadoLocation courtLocation,
      List<CourtSched> courtScheds,
      List<CourtSched> specialCourtScheds,
    )
        setupCourtProviders,
  ) {
    tecCourtName.text = court.name;
    tecCourtPhotoUrl.text = court.photoUrl;
    tecTicketPrice.text = court.ticketPrice.toStringAsFixed(2);
    tecMaxPerSlot.text = court.maxPerSlot.toString();
    tecMinPerSlot.text = court.minPerSlot.toString();
    setupCourtProviders(
      court.location,
      court.courtScheds,
      court.specialCourtScheds,
    );
  }
}
