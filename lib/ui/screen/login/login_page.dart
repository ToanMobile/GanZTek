import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ganz_tek/common/constant.dart';
import 'package:ganz_tek/config/router_manger.dart';
import 'package:ganz_tek/generated/i18n.dart';
import 'package:ganz_tek/ui/screen/login/widget/login_bg_widget.dart';
import 'package:ganz_tek/ui/screen/login/widget/signup_widget.dart';
import 'package:ganz_tek/ui/widget/app_bar.dart';
import 'package:ganz_tek/ui/widget/button_progress_indicator.dart';
import 'package:ganz_tek/ui/widget/filled_round_button.dart';
import 'package:ganz_tek/res/colors.dart';
import 'package:ganz_tek/res/dimens.dart';
import 'package:ganz_tek/res/sizebox.dart';
import 'package:ganz_tek/res/text_styles.dart';
import 'package:ganz_tek/viewmodel/login_model.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'widget/login_field_widget.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _pwdFocus = FocusNode();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _nameController.text = 'tranminh1236@gmail.com';
    _passwordController.text = 'soluuhuong1236';
    return ViewModelProvider<LoginModel>.withoutConsumer(
      viewModel: LoginModel(),
      onModelReady: (model) => model.login(_nameController.text, _passwordController.text),
      builder: (context, model, _) => Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: ColorsUtils.pale,
        appBar: AppBarIcon.back().build(context),
        body: Stack(
          children: <Widget>[
            BackgroundLogin(),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              padding: EdgeInsets.all(DimensUtils.size40),
              child: Form(
                key: _formKey,
                child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
                  buildTextTitleLogin(),
                  SizeBoxUtils.hGap10,
                  SingUpWidget(_nameController),
                  SizeBoxUtils.hGap40,
                  buildTextUserName(),
                  SizeBoxUtils.hGap10,
                  LoginTextField(
                    label: S.of(context).login_username,
                    icon: Icons.person,
                    controller: _nameController,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (text) {
                      FocusScope.of(context).requestFocus(_pwdFocus);
                    },
                  ),
                  SizeBoxUtils.hGap30,
                  buildTextPassword(),
                  SizeBoxUtils.hGap10,
                  LoginTextField(
                    controller: _passwordController,
                    label: S.of(context).login_password,
                    icon: Icons.vpn_key,
                    obscureText: true,
                    focusNode: _pwdFocus,
                    textInputAction: TextInputAction.done,
                  ),
                  SizeBoxUtils.hGap30,
                  LoginButton(_formKey, _nameController, _passwordController)
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildTextTitleLogin() => Text(S.of(context).signIn, style: TextStylesUtils.styleAvenir20CoalGreyW600);

  Widget buildTextUserName() => Text(S.of(context).login_username, style: TextStylesUtils.styleAvenir12BrownGreyW400);

  Widget buildTextPassword() => Text(S.of(context).login_password, style: TextStylesUtils.styleAvenir12BrownGreyW400);
}

class LoginButton extends StatelessWidget {
  final nameController;
  final passwordController;
  final _formKey;

  LoginButton(this._formKey, this.nameController, this.passwordController);

  @override
  Widget build(BuildContext context) {
    var model = Provider.of<LoginModel>(context);
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
          //var formState = Form.of(context);
          if (_formKey.currentState.validate()) {
            model.login(nameController.text, passwordController.text).then((value) {
              if (value) {
                Navigator.pushNamed(context, RouteName.home);
              } else {
                model.showErrorMessage(context);
              }
            });
          }
        });
  }
}
