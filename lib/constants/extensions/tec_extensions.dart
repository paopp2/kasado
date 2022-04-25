import 'package:flutter/material.dart';

extension TecExtensions on TextEditingController {
  /// Select (highlight) all of this TextEditingController's text
  void selectText() {
    selection = TextSelection(
      baseOffset: 0,
      extentOffset: text.length,
    );
  }
}
