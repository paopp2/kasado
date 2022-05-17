import 'package:flutter/material.dart';
import 'package:kasado/constants/enums/player_position.dart';
import 'package:kasado/model/user_bio/user_bio.dart';

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

  void setupUserBioToEdit(
    UserBio? userBio,
    Function(
      DateTime? birthDate,
      List<PlayerPosition> positions,
    )
        setupUserBioProviders,
  ) {
    tecHeightFt.text = userBio?.heightFt?.toStringAsFixed(0) ?? '';
    tecHeightIn.text = userBio?.heightIn?.toStringAsFixed(0) ?? '';
    tecWeight.text = userBio?.weight?.toStringAsFixed(0) ?? '';
    setupUserBioProviders(
      userBio?.birthdate,
      userBio?.positions ?? [],
    );
  }
}
