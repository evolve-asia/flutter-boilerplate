import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/utils/colors.dart';
import 'package:flutter_boilerplate/utils/dimens.dart';
import 'package:flutter_boilerplate/utils/text_styles.dart';

class RoundedFilledButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onPress;

  const RoundedFilledButtonWidget(
      {Key? key, required this.text, required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: Dimens.spacing_50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: const AppColors().blue_2E5BFF),
        onPressed: onPress,
        child: Text(
          text,
          style: text_FFFFFF_15_Medium,
        ),
      ),
    );
  }
}
