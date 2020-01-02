import 'package:flutter/cupertino.dart';
import 'package:ganz_tek/generated/i18n.dart';
import 'package:ganz_tek/res/dimens.dart';
import 'package:ganz_tek/res/text_styles.dart';
import 'package:ganz_tek/common/constant.dart';
import 'package:ganz_tek/config/router_manger.dart';
import 'package:ganz_tek/ui/widget/button_progress_indicator.dart';
import 'package:ganz_tek/ui/widget/filled_round_button.dart';
import 'package:ganz_tek/viewmodel/login_model.dart';
import 'package:provider_architecture/provider_widget.dart';

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
            height: DimensUtils.size50,
            child: Center(
              child: ButtonProgressIndicator(),
            ),
          )
        : Container(
            height: DimensUtils.size50,
            child: Center(
              child: Text(
                S.of(context).signIn,
                style: TextStylesUtils.styleAvenir14WhiteW600,
              ),
            ),
          );
    return FilledRoundButton.withGradient(
      radius: DimensUtils.size10,
      gradientColor: Constant.gradient_WaterMelon_Melon,
      child: child,
      cb: () {
        if (_formKey.currentState.validate()) {
          if (emailController != null) {
            model.register(nameController.text, emailController.text, passwordController.text).then((value) {
              if (value) {
                Navigator.pushNamed(context, RouteName.register_success);
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