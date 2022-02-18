import 'package:flutter/cupertino.dart';

mixin CourtsOwnedTecMixin {
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
}
