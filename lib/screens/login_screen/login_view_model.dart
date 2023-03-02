import 'package:flutter/material.dart';

import '../../data/repositories/user/user.dart';
import '../../presentation/string_manager.dart';

class LoginViewModel extends ChangeNotifier {
  final UserRepo _repo;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  LoginViewModel({required UserRepo repo}) : _repo = repo;

  Future<bool> signIn() async {
    FocusManager.instance.primaryFocus?.unfocus();
    final hasSignedIn = await _repo.signIn(
        emailController.value.text, passwordController.value.text);
    _checkEmptyFields();
    return hasSignedIn;
  }

  String? _checkEmptyFields() {
    if (emailController.value.text.isEmpty ||
        passwordController.value.text.isEmpty) {
      return AppStrings.emptyFieldsException;
    }
    return null;
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    _repo.signOut();
  }
}
