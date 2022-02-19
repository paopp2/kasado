import 'package:flutter/cupertino.dart';
import 'package:kasado/constants/date_time_related_constants.dart';
import 'package:kasado/model/court/court.dart';

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
    void Function(
      List<int> dayChipIndices,
      List<int> schedChipIndices,
    )
        setupScheduleChips,
  ) {
    tecCourtName.text = court.name;
    tecCourtPhotoUrl.text = court.photoUrl;
    tecCourtAddress.text = court.address;
    tecTicketPrice.text = court.ticketPrice.toStringAsFixed(2);
    setupScheduleChips(
      court.allowedWeekDays.map((d) => indexToWeekDay.indexOf(d)).toList(),
      court.allowedTimeSlots.map((t) => allowedTimeRanges.indexOf(t)).toList(),
    );
  }
}
