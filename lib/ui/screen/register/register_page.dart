import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ganz_tek/generated/i18n.dart';
import 'package:ganz_tek/res/colors.dart';
import 'package:ganz_tek/res/dimens.dart';
import 'package:ganz_tek/res/sizebox.dart';
import 'package:ganz_tek/res/text_styles.dart';
import 'package:ganz_tek/ui/screen/login/widget/login_bg_widget.dart';
import 'package:ganz_tek/ui/screen/login/widget/login_field_widget.dart';
import 'package:ganz_tek/ui/screen/login/widget/login_progress_widget.dart';
import 'package:ganz_tek/ui/screen/register/widget/signin_widget.dart';
import 'package:ganz_tek/ui/widget/app_bar.dart';
import 'package:ganz_tek/viewmodel/login_model.dart';
import 'package:provider_architecture/viewmodel_provider.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  final _pwdFocus = FocusNode();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameController.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<LoginModel>.withoutConsumer(
      viewModel: LoginModel(),
      onModelReady: (model) => model.idle,
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
                  SingInWidget(_nameController),
                  SizeBoxUtils.hGap10,
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
                  SizeBoxUtils.hGap10,
                  buildTextPassword(),
                  SizeBoxUtils.hGap10,
                  LoginTextField(
                    controller: _emailController,
                    label: S.of(context).login_password,
                    icon: Icons.vpn_key,
                    obscureText: true,
                    focusNode: _pwdFocus,
                    textInputAction: TextInputAction.done,
                  ),
                  SizeBoxUtils.hGap10,
                  buildTextConfirmPassword(),
                  SizeBoxUtils.hGap10,
                  LoginTextField(
                    controller: _passwordController,
                    label: S.of(context).login_confirm_password,
                    icon: Icons.vpn_key,
                    obscureText: true,
                    focusNode: _pwdFocus,
                    textInputAction: TextInputAction.done,
                  ),
                  SizeBoxUtils.hGap40,
                  LoginProgressButton(_formKey, _nameController, _emailController, _passwordController),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildTextTitleLogin() => Text(S.of(context).signUp, style: TextStylesUtils.styleAvenir20CoalGreyW600);

  Widget buildTextUserName() => Text(S.of(context).login_username, style: TextStylesUtils.styleAvenir12BrownGreyW400);

  Widget buildTextPassword() => Text(S.of(context).login_password, style: TextStylesUtils.styleAvenir12BrownGreyW400);

  Widget buildTextConfirmPassword() => Text(S.of(context).login_confirm_password, style: TextStylesUtils.styleAvenir12BrownGreyW400);
}
