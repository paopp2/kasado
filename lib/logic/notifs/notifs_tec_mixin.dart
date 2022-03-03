import 'package:flutter/material.dart';

mixin NotifsTecMixin {
  final tecNotifTitle = TextEditingController();
  final tecNotifBody = TextEditingController();

  void clearAllTecs() {
    tecNotifTitle.clear();
    tecNotifBody.clear();
  }
}
