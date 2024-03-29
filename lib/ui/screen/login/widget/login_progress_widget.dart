import 'package:flutter/cupertino.dart';
import 'package:blendtv/generated/l10n.dart';
import 'package:blendtv/res/text_styles.dart';
import 'package:blendtv/common/constant.dart';
import 'package:blendtv/config/router_manger.dart';
import 'package:blendtv/ui/widget/button_progress_indicator.dart';
import 'package:blendtv/ui/widget/filled_round_button.dart';
import 'package:blendtv/viewmodel/login_model.dart';
import 'package:provider_architecture/provider_widget.dart';
import 'package:blendtv/lib/screenutils/size_extension.dart';

class LoginProgressButton extends ProviderWidget<LoginModel> {
  final nameController;
  final passwordController;
  final emailController;
  final _formKey;

  LoginProgressButton(this._formKey, this.nameController, this.passwordController, this.emailController);

  @override
  Widget build(BuildContext context, LoginModel model) {
    Widget child = model.busy
        ? Container(
            height: 150.h,
            child: Center(
              child: ButtonProgressIndicator(),
            ),
          )
        : Container(
            height: 150.h,
            child: Center(
              child: Text(
                S.of(context).signIn,
                style: TextStylesUtils().styleMedium20TextSelect,
              ),
            ),
          );
    return FilledRoundButton.withGradient(
      radius: 10,
      gradientColor: Constant.gradient_WaterMelon_Melon,
      child: child,
      cb: () {
        if (_formKey.currentState.validate()) {
          if (emailController != null) {
            model.register(nameController.text, emailController.text, passwordController.text).then((value) {
              if (value) {
                Navigator.pushNamed(context, RouteName.home);
              } else {
                model.showErrorMessage(context);
              }
            });
          } else {
            model.login(nameController.text, passwordController.text).then(
              (value) {
                if (value) {
                  Navigator.pushNamed(context, RouteName.home);
                } else {
                  model.showErrorMessage(context);
                }
              },
            );
          }
        }
      },
    );
  }
}
