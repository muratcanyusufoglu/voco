import 'dart:async';

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
  static final loginProvider = ChangeNotifierProvider((ref) => LoginProvider());

  bool _loading = false;
  bool get loading => _loading;

  String _userName = '';
  String get userName => _userName;

  final TextEditingController _userNameController = TextEditingController();
  TextEditingController get userNameController => _userNameController;

  String _password = '';
  String get password => _password;

  bool _userAlreadyLogin = false;
  bool get userAlreadyLogin => _userAlreadyLogin;

  bool _isLoginSuccess = false;
  bool get isLoginSuccess => _isLoginSuccess;

  bool _isErrorActive = false;
  bool get isErrorActive => _isErrorActive;

  bool _textFieldEmptyError = false;
  bool get textFieldEmptyError => _textFieldEmptyError;

  bool _showPassword = false;
  bool get showPassword => _showPassword;
  
  late Timer _timer;
  bool _isSplashFinished = false;
  bool get isSplashFinished => _isSplashFinished;

  void setShowPassword() {
    _showPassword = !showPassword;
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

        //servisten cevap döndükten sonra kullanıcının login sonucunu rahat görebilmesi
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

  //user tokenın kaydedilmesi
  void _setTokenToPreferences(String token) async {
    if (token != '') {
      await SharedManager().setString(SharedEnum.userToken, token);
    }
  }

  void getTokenToPreferences() async {
    await SharedManager().initInstances();
    final String resp = await SharedManager().getString(SharedEnum.userToken);
    if (resp != '') {
      _userAlreadyLogin = true;
    }
        _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timer.tick == 1) {
        _timer.cancel();
        _isSplashFinished = true;
        notifyListeners();
      }
    });
  }

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
    notifyListeners();
  }
}

class LoginPassword extends ChangeNotifier {}
