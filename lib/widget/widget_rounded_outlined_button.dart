import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/utils/text_styles.dart';
import 'package:flutter_boilerplate/utils/widget_functions.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/dimens.dart';

class RoundedOutlinedButtonWidget extends StatelessWidget {
  final String image;
  final String text;

  const RoundedOutlinedButtonWidget(
      {Key? key, required this.image, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: Dimens.spacing_50,
      child: OutlinedButton(
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(image,
                height: Dimens.spacing_24, width: Dimens.spacing_24),
            addHorizontalSpace(Dimens.spacing_8),
            Text(text, style: text_2E384D_12_Regular),
          ],
        ),
      ),
    );
  }
}
