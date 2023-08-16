import 'package:flutter/cupertino.dart';
import 'package:flutter_boilerplate/feature/auth/data/model/login_request.dart';
import 'package:flutter_boilerplate/feature/auth/screens/today/today_screen.dart';
import 'package:flutter_boilerplate/utils/dimens.dart';
import 'package:flutter_boilerplate/utils/image_constants.dart';
import 'package:flutter_boilerplate/utils/strings.dart';
import 'package:flutter_boilerplate/utils/text_styles.dart';
import 'package:flutter_boilerplate/utils/widget_functions.dart';
import 'package:flutter_boilerplate/widget/widget_rounded_filled_button.dart';
import 'package:flutter_boilerplate/widget/widget_rounded_outlined_button.dart';
import 'package:flutter_boilerplate/widget/widget_text_field.dart';
import 'package:provider/provider.dart';

import '../../../../anim/anim_scale_transition.dart';
import '../../../../utils/response_state.dart';
import '../../../../widget/widget_text_field_password.dart';
import 'login_viewmodel.dart';

class SnippetLoginScreenForm extends StatefulWidget {
  const SnippetLoginScreenForm({Key? key}) : super(key: key);

  @override
  State<SnippetLoginScreenForm> createState() => _SnippetLoginScreenFormState();
}

class _SnippetLoginScreenFormState extends State<SnippetLoginScreenForm> {
  final _formKey = GlobalKey<FormState>();
  late String _phone, _password;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(
            left: Dimens.spacing_32, right: Dimens.spacing_32),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(Strings.phone_number.toUpperCase(),
                  style: text_BOBAC9_12_Medium_Caps),
              addVerticalSpace(Dimens.spacing_8),
              TextFieldWidget(
                  hintText: '',
                  validator: (String value) {
                    if (value.isEmpty) {
                      return Strings.field_should_not_be_empty;
                    } else if (value.length != 10) {
                      return Strings.enter_valid_phone_number;
                    } else {
                      return null;
                    }
                  },
                  onSaved: (String value) {
                    _phone = value;
                  },
                  shouldBeNumber: true),
              addVerticalSpace(Dimens.spacing_16),
              Text(Strings.password.toUpperCase(),
                  style: text_BOBAC9_12_Medium_Caps),
              addVerticalSpace(Dimens.spacing_8),
              TextFieldPasswordWidget(
                hintText: '',
                validator: (String value) {
                  if (value.isEmpty) {
                    return Strings.password_should_not_be_emoty;
                  } else {
                    return null;
                  }
                },
                onSaved: (String value) {
                  _password = value;
                },
                maxLength: 20,
                lableText: '',
                showPassword: true,
              ),
              addVerticalSpace(Dimens.spacing_8),
              Container(
                alignment: Alignment.topRight,
                child: const Text(
                  Strings.forgot_password,
                  style: text_2E5BFF_12_Regular,
                ),
              ),
              getErrorMessage(),
              addVerticalSpace(Dimens.spacing_30),
              getSignInButton(),
              addVerticalSpace(Dimens.spacing_56),
              Container(
                  alignment: Alignment.center,
                  child: const Text(Strings.need_help,
                      style: text_8798AD_10_Regular)),
              addVerticalSpace(Dimens.spacing_4),
              const RoundedOutlinedButtonWidget(
                  image: ImageConstants.IC_VIBER, text: '9849000000'),
              addVerticalSpace(Dimens.spacing_56)
            ],
          ),
        ),
      ),
    );
  }

  Widget getSignInButton() {
    return Consumer<LoginViewModel>(
        builder: (context, viewModel, _) => RoundedFilledButtonWidget(
            text: Strings.sign_in,
            onPress: () async {
              if (validate()) {
                await viewModel.login(LoginRequest(
                    username: _phone, password: _password, apkVersion: '1.1.0'));
                observeLoginResponse(viewModel);
              }
            }));
  }

  Widget getErrorMessage() {
    return Consumer<LoginViewModel>(builder: (context, loginViewModel, _) {
      if (loginViewModel.loginUseCase.state == ResponseState.ERROR) {
        return Text(loginViewModel.loginUseCase.exception.toString(),
            style: text_FF4949_12_Regular);
      } else {
        return const SizedBox();
      }
    });
  }

  bool validate() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      return true;
    } else {
      return false;
    }
  }

  void observeLoginResponse(LoginViewModel viewModel) {
    if (viewModel.loginUseCase.state == ResponseState.COMPLETE) {
      Navigator.push(context, AnimScaleTransition(page: const TodayScreen()));
    }
  }
}
