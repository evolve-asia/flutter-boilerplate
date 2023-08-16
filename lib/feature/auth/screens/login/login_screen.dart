import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/di/service_locator.dart';
import 'package:flutter_boilerplate/feature/auth/screens/login/login_viewmodel.dart';
import 'package:flutter_boilerplate/utils/colors.dart';
import 'package:flutter_boilerplate/utils/image_constants.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../../utils/dimens.dart';
import '../../../../utils/response_state.dart';
import '../../../../utils/strings.dart';
import '../../../../utils/text_styles.dart';
import '../../../../utils/widget_functions.dart';
import 'snippet_login_screen_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginViewModel viewModel = locator<LoginViewModel>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginViewModel>(
      create: (BuildContext context) => viewModel,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Material(
              child: Container(
                color: const AppColors().backGroundColor,
                child: Column(children: [
                  getProgressIndicator(),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: Dimens.spacing_100,
                        right: Dimens.spacing_100,
                        top: Dimens.spacing_56),
                    child: SvgPicture.asset(ImageConstants.IC_APP_LOGO,
                        height: Dimens.spacing_100, width: Dimens.spacing_56),
                  ),
                  addVerticalSpace(Dimens.spacing_56),
                  const Text(
                    Strings.sign_in,
                    textAlign: TextAlign.center,
                    style: text_2E384D_28_Light,
                  ),
                  addVerticalSpace(Dimens.spacing_48),
                  const SnippetLoginScreenForm(),
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget getProgressIndicator() {
    return Consumer<LoginViewModel>(builder: (context, viewModel, _) {
      if (viewModel.loginUseCase.state == ResponseState.LOADING) {
        return LinearProgressIndicator(
          backgroundColor: const AppColors().blue_2E5BFF,
        );
      } else {
        return const SizedBox(
          height: Dimens.spacing_4,
        );
      }
    });
  }
}
