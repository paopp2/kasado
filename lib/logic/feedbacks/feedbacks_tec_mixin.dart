import 'package:flutter/material.dart';

mixin FeedbacksTecMixin {
  final tecFeedbackTitle = TextEditingController();
  final tecFeedbackBody = TextEditingController();

  void clearAllTecs() {
    tecFeedbackTitle.clear();
    tecFeedbackBody.clear();
  }
}
