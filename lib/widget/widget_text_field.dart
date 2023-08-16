import 'package:flutter/material.dart';

import '../utils/colors.dart';

class TextFieldWidget extends StatelessWidget {
  final String hintText;
  final Function validator;
  final Function onSaved;
  final bool shouldBeNumber;
  final String? lableText;

  const TextFieldWidget(
      {Key? key,
      required this.hintText,
      required this.validator,
      required this.onSaved,
      required this.shouldBeNumber,
      this.lableText = ''})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (input) => validator(input),
      onSaved: (input) => onSaved(input),
      keyboardType: shouldBeNumber ? TextInputType.number : TextInputType.text,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 11, horizontal: 16),
        hintText: hintText,
        filled: true,
        fillColor: const AppColors().blue_32e0e7ff,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: const AppColors().blue_e0e7ff),
          borderRadius: BorderRadius.circular(5),
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: const AppColors().blue_2E5BFF),
            borderRadius: BorderRadius.circular(5)),
      ),
      controller: TextEditingController.fromValue(TextEditingValue(
          text: (lableText == '0') ? '' : lableText!,
          selection: TextSelection.collapsed(offset: lableText!.length))),
    );
  }
}
