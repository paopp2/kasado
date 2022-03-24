import 'package:flutter/material.dart';

mixin FeedbacksTecMixin {
  final tecFeedbackTitle = TextEditingController();
  final tecFeedbackBody = TextEditingController();

  void clearAllTecs() {
    tecFeedbackBody.clear();
    tecFeedbackBody.clear();
  }
}
