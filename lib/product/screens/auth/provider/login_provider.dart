import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voco/feature/constants/database/shared_manager.dart';
import 'package:voco/feature/constants/enums/shared_enums.dart';
import 'package:voco/feature/models/login_model.dart';
import 'package:voco/product/screens/auth/service/auth_service_repository_impl.dart';

import '../../../../feature/components/snackBar/snackbar.dart';
import '../../../../feature/injection.dart';

class LoginProvider extends ChangeNotifier {
  final AuthServiceRepositoryImpl _authService = Injection.getIt.get<AuthServiceRepositoryImpl>();
  static final loginProvider = ChangeNotifierProvider((_) => LoginProvider());

  bool _loading = false;
  bool get loading => _loading;

  String _userName = '';
  String get userName => _userName;

  final TextEditingController _userNameController = TextEditingController();
  TextEditingController get userNameController => _userNameController;

  String _password = '';
  String get password => _password;

  bool _isLoginSuccess = false;
  bool get isLoginSuccess => _isLoginSuccess;

  bool _isErrorActive = false;
  bool get isErrorActive => _isErrorActive;

  bool _textFieldEmptyError = false;
  bool get textFieldEmptyError => _textFieldEmptyError;

  bool _rememberMe = false;
  bool get rememberMe => _rememberMe;

  String _userToken = '';
  String _userTokenName = '';

  String _userId = '';
  String get userId => _userId;

  bool _showPassword = false;
  bool get showPassword => _showPassword;

  void setShowPassword() {
    _showPassword = !showPassword;
    notifyListeners();
  }

  void setRememberMe(bool value) {
    _rememberMe = value;
  }

  void getRememberInfo() async {
    _userNameController.text = await SharedManager().getString(SharedEnum.userNameLogin);
    notifyListeners();
  }

  void logIn(BuildContext context) async {
    if (_userName.isNotEmpty && _password.isNotEmpty) {
      _loading = true;
      notifyListeners();
      final response = await _authService.login(userName, password);

      LoginModel loginModel;
      response.fold((login) {
        _isLoginSuccess = true;
        notifyListeners();

        Future.delayed(const Duration(milliseconds: 2000), () {
          loginModel = login;
          _setTokenToPreferences(login.token ?? '');
          _setField();
        });

        Future.delayed(const Duration(milliseconds: 1000), () {
          notifyListeners();
          _loading = false;
          _isLoginSuccess = false;
        });
      }, (error) {
        _isLoginSuccess = false;
        _isErrorActive = true;
        _loading = false;
        notifyListeners();
        Future.delayed(const Duration(milliseconds: 1000), () {
          _isErrorActive = false;
        });
      });
    } else {
      _textFieldEmptyError = true;
      notifyListeners();
      Future.delayed(const Duration(milliseconds: 1000), () {
        _textFieldEmptyError = false;
      });
    }
  }

  void _setTokenToPreferences(String token) async {
    if (token != '') {
      await SharedManager().setString(SharedEnum.userToken, token);
    }
  }

  // void _setUserName(BuildContext context) async {
  //   Provider.of<GlobalProvider>(context, listen: false).setUserName(_userTokenName);
  // }

  void _setField() {
    _userName = "";
    _password = "";
  }

  // set functions
  void setUserName(String value) {
    _userName = value;
  }

  void setPassword(String value) {
    _password = value;
  }

  void showSnckbar(BuildContext context, String message, String type) {
    snackBar(context, message, type);
  }

  void setStart() {
    _password = '';
    _userName = '';
    _isLoginSuccess = false;
    _textFieldEmptyError = false;
    _isErrorActive = false;
    _userToken = '';
    notifyListeners();
  }
}

class LoginPassword extends ChangeNotifier {}
