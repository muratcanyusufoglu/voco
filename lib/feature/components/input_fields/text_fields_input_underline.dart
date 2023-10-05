import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants/other/colors.dart';

class TextFieldsInputUnderline extends StatelessWidget {
  const TextFieldsInputUnderline(
      {super.key,
      required this.hintText,
      required this.onChanged,
      this.enabled,
      this.keyboardType,
      this.inputFormatters,
      this.maxLines,
      this.textInputAction,
      this.minLines,
      this.controller});

  final String _validatorHintText = 'Lütfen bu alanı doldurunuz';

  final String hintText;
  final Function onChanged;
  final bool? enabled;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputAction? textInputAction;
  final int? maxLines;
  final int? minLines;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled ?? true,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      textInputAction: textInputAction ?? TextInputAction.next,
      keyboardType: keyboardType ?? TextInputType.text,
      controller: controller,
      decoration: InputDecoration(
        disabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: APPColors.Main.grey),
        ),
        border: const UnderlineInputBorder(),
        hintText: hintText,
      ),
      inputFormatters: inputFormatters,
      maxLines: maxLines ?? 1,
      minLines: minLines ?? 1,
      onChanged: (inputValue) => onChanged(inputValue),
      style: TextStyle(fontSize: 16, letterSpacing: 1, fontFamily: 'Roboto', color: APPColors.Main.black),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return _validatorHintText;
        }
        return null;
      },
    );
  }
}
