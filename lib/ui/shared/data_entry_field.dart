import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kasado/logic/shared/input_validators.dart';

class DataEntryField extends StatelessWidget {
  const DataEntryField({
    Key? key,
    required this.hint,
    this.tec,
    this.maxLength,
    this.isDisabled = false,
    this.validator = InputValidator.mustNotBeEmpty,
    this.isMoney = false,
    this.onChanged,
    this.maxLines = 1,
    this.onFieldSubmitted,
    this.focusNode,
    this.initialValue,
    this.textInputAction = TextInputAction.next,
    this.autofocus = false,
  }) : super(key: key);

  final String hint;
  final TextEditingController? tec;
  final int? maxLength;
  final bool isDisabled;
  final bool isMoney;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final int? maxLines;
  final void Function(String)? onFieldSubmitted;
  final FocusNode? focusNode;
  final String? initialValue;
  final TextInputAction? textInputAction;
  final bool autofocus;

  @override
  Widget build(BuildContext context) {
    final List<TextInputFormatter> textInputFormatters = [];
    if (isMoney) {
      textInputFormatters.add(
        FilteringTextInputFormatter.allow(
          RegExp(r'^\d+\.?\d{0,2}'),
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        initialValue: initialValue,
        validator: validator,
        onChanged: onChanged,
        autovalidateMode:
            (validator != null) ? AutovalidateMode.onUserInteraction : null,
        enabled: !isDisabled,
        maxLength: maxLength,
        maxLines: maxLines,
        inputFormatters:
            (textInputFormatters.isNotEmpty) ? textInputFormatters : null,
        controller: tec,
        onFieldSubmitted: onFieldSubmitted,
        focusNode: focusNode,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey.shade100,
          labelText: hint,
          alignLabelWithHint: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
        textInputAction: textInputAction,
        autofocus: autofocus,
      ),
    );
  }
}
