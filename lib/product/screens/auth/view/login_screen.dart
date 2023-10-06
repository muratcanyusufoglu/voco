import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:voco/feature/buttons/custom_login_button.dart';
import 'package:voco/feature/components/input_fields/text_fields_input_underline.dart';
import 'package:voco/feature/components/input_fields/text_fields_password_input_underline.dart';
import 'package:voco/feature/components/snackBar/snackbar.dart';
import 'package:voco/feature/constants/other/snackbar_strings.dart';
import 'package:voco/product/screens/auth/provider/login_provider.dart';

class LoginScreen extends HookConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginProvider = ref.watch(LoginProvider.loginProvider);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      loginProvider.isLoginSuccess ? context.go('/home') : null;
      if (loginProvider.isErrorActive) {
        snackBar(context, SnackbarStrings.loginError, 'error');
      }
      if (loginProvider.textFieldEmptyError) {
        snackBar(context, SnackbarStrings.loginEmptyError, 'error');
      }
      if (loginProvider.isLoginSuccess) {
        snackBar(context, SnackbarStrings.loginSuccess, 'success');
        //context.read<GlobalProvider>().setUserId(loginProvider.userId);
      }
    });

    return _LoginScreenBody(provider: loginProvider);
  }
}

class _LoginScreenBody extends StatefulWidget {
  const _LoginScreenBody({required this.provider});
  final LoginProvider provider;

  @override
  State<_LoginScreenBody> createState() => _LoginScreenBodyState();
}

class _LoginScreenBodyState extends State<_LoginScreenBody> {
  final GlobalKey<ScaffoldMessengerState> _globalKey = GlobalKey<ScaffoldMessengerState>();

  final String _userNameHint = 'Kullanıcı Adı';
  final String _passwordHint = 'Şifre';
  final String _login = 'Giriş Yap';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    widget.provider.isLoginSuccess ? context.go('/home') : null;
    return Scaffold(
      key: _globalKey,
      appBar: AppBar(),
      body: widget.provider.loading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: <Widget>[
                _loginTitleWidget(),
                _textFields(context, widget.provider),
                _loginButton(),
              ],
            ),
    );
  }

  Expanded _loginButton() {
    return Expanded(
      flex: 2,
      child: CustomLoginButton(title: _login, onPressed: widget.provider.logIn),
    );
  }

  Widget _textFields(BuildContext context, LoginProvider loginProvider) {
    return Expanded(
      flex: 3,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            TextFieldsInputUnderline(
              hintText: _userNameHint,
              onChanged: loginProvider.setUserName,
              controller: loginProvider.userNameController,
            ),
            TextInputFieldsPasswordInputUnderline(
              hintText: _passwordHint,
              onChanged: loginProvider.setPassword,
              changeVisibility: loginProvider.setShowPassword,
              showPassword: loginProvider.showPassword,
            ),
          ],
        ),
      ),
    );
  }

  Expanded _loginTitleWidget() {
    return Expanded(
      flex: 1,
      child: Text(
        _login,
        style: const TextStyle(fontSize: 28, fontFamily: 'Roboto'),
      ),
    );
  }
}
