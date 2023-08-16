import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/utils/colors.dart';

class TextFieldPasswordWidget extends StatefulWidget {
  final String hintText;
  final Function validator;
  final Function onSaved;
  bool showPassword;
  final String lableText;
  final int maxLength;

  TextFieldPasswordWidget(
      {Key? key,
      required this.hintText,
      required this.validator,
      required this.onSaved,
      required this.showPassword,
      required this.lableText,
      required this.maxLength})
      : super(key: key);

  @override
  State<TextFieldPasswordWidget> createState() =>
      _TextFieldPasswordWidgetState();
}

class _TextFieldPasswordWidgetState extends State<TextFieldPasswordWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.showPassword ? true : false,
      validator: (input) => widget.validator(input),
      onSaved: (input) => widget.onSaved(input),
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: Icon(
            widget.showPassword ? Icons.visibility_off : Icons.visibility,
            color: const AppColors().grey_bfc5d2,
          ),
          onPressed: () {
            setState(() {
              widget.showPassword = !widget.showPassword;
            });
          },
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 11, horizontal: 16),
        hintText: widget.hintText,
        filled: true,
        fillColor: const AppColors().blue_32e0e7ff,
        enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: const AppColors().blue_e0e7ff, width: 1.0),
          borderRadius: BorderRadius.circular(5.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: const AppColors().blue_2E5BFF, width: 1.0),
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
    );
  }
}
