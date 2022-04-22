import 'package:flutter/cupertino.dart';
import 'package:kasado/model/court/court.dart';
import 'package:kasado/model/court_sched/court_sched.dart';

mixin CourtAdminTecMixin {
  final tecCourtName = TextEditingController();
  final tecCourtPhotoUrl = TextEditingController();
  final tecCourtAddress = TextEditingController();
  final tecTicketPrice = TextEditingController();

  void clearAllTecs() {
    tecCourtName.clear();
    tecCourtPhotoUrl.clear();
    tecCourtAddress.clear();
    tecTicketPrice.clear();
  }

  void setupCourtToEdit(
    Court court,
    void Function(List<CourtSched> courtScheds) setupScheduleChips,
  ) {
    tecCourtName.text = court.name;
    tecCourtPhotoUrl.text = court.photoUrl;
    tecCourtAddress.text = court.address;
    tecTicketPrice.text = court.ticketPrice.toStringAsFixed(2);
    setupScheduleChips(court.courtScheds);
  }
}
