import 'package:flutter/material.dart';

import '../../data/services/auth_service.dart';
import '../../presentation/string_manager.dart';

class LoginViewModel extends ChangeNotifier {
  final AuthService _authService;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  LoginViewModel({required AuthService authService})
      : _authService = authService;

  String get exceptionText => _authService.exceptionMessage;

  Future<bool> signIn() async {
    FocusManager.instance.primaryFocus?.unfocus();
    _authService.exceptionMessage = '';
    final user = await _authService.signIn(
        emailController.value.text, passwordController.value.text);
    checkEmptyFields();
    return user;
  }

  void checkEmptyFields() {
    if (emailController.value.text.isEmpty ||
        passwordController.value.text.isEmpty) {
      _authService.exceptionMessage = AppStrings.emptyFieldsException;
    }
  }
}
