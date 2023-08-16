import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/utils/colors.dart';
import 'package:flutter_boilerplate/utils/image_constants.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/strings.dart';
import '../utils/text_styles.dart';

AppBar todayAppBar() {
  return AppBar(
    centerTitle: false,
    title: const Text(Strings.today, style: text_2E384D_15_Medium),
    backgroundColor: const AppColors().white_ffffff,
    elevation: 0,
    actions: <Widget>[
      IconButton(
        icon: SvgPicture.asset(ImageConstants.IC_NOTIFICATION),
        onPressed: () {},
      )
    ],
  );
}
