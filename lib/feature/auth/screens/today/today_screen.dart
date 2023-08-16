import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/widget/component_home_app_bar.dart';
import 'package:flutter_boilerplate/widget/component_home_navigation_drawer.dart';

import '../../../../utils/colors.dart';

class TodayScreen extends StatefulWidget {
  const TodayScreen({Key? key}) : super(key: key);

  @override
  State<TodayScreen> createState() => _TodayScreenState();
}

class _TodayScreenState extends State<TodayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: todayAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: const AppColors().backGroundColor,
          ),
        ),
      ),
      drawer: const NavigationDrawer(),
    );
  }
}
