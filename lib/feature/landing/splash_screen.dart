import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/feature/auth/screens/login/login_screen.dart';
import 'package:flutter_boilerplate/feature/auth/screens/today/today_screen.dart';
import 'package:flutter_boilerplate/utils/colors.dart';
import 'package:flutter_boilerplate/utils/image_constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../anim/anim_scale_transition.dart';
import '../../di/service_locator.dart';
import '../../storage/shared_pref_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    final SharedPrefManager sharedPrefManager = locator<SharedPrefManager>();
    var userId = sharedPrefManager.getUserId();

    Timer(
        const Duration(seconds: 3),
        () => Navigator.push(
            context,
            AnimScaleTransition(
                page: (userId != null && userId > 0)
                    ? const TodayScreen()
                    : const LoginScreen())));
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
        width: size.width,
        height: size.height,
        color: const AppColors().backGroundColor,
        child: Padding(
          padding: const EdgeInsets.all(100),
          child: SvgPicture.asset(ImageConstants.IC_APP_LOGO,
              height: 100, width: 56),
        ));
  }
}
