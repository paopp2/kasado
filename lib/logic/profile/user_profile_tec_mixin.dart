import 'package:flutter/material.dart';

mixin UserProfileTecMixin {
  final tecBirthdate = TextEditingController();
  final tecHeightFt = TextEditingController();
  final tecHeightIn = TextEditingController();
  final tecWeight = TextEditingController();

  void clearAllTecs() {
    tecBirthdate.clear();
    tecHeightFt.clear();
    tecHeightIn.clear();
    tecWeight.clear();
  }
}
