import 'package:flutter/material.dart';

import '../../data/services/auth_service.dart';
import '../../models/ui/user_model_data.dart';

class RegisterViewModel extends ChangeNotifier {
  final Map<String, TextEditingController> controllers = {
    'firstName': TextEditingController(),
    'lastName': TextEditingController(),
    'email': TextEditingController(),
    'password': TextEditingController(),
    'confirmPassword': TextEditingController(),
  };
  final AuthService _authServices;
  bool formsState = false;
  bool isValidPassword = true;

  RegisterViewModel({required AuthService authServices})
      : _authServices = authServices;

  Future<void> registerUser() async {
    final email = controllers['email']?.value.text ?? '';
    final password = controllers['password']?.value.text ?? '';
    final firstName = controllers['firstName']?.value.text ?? '';
    final lastName = controllers['lastName']?.value.text ?? '';
    if (formsState) {
      print('zdr');
      final user = UserDataModel(email, firstName, lastName, password);
      await _authServices.signUp(user);
    }
  }

  bool get checkCurrentFormState {
    bool isValid = true;
    isValid = checkEmail &&
        checkPasswordRequirements &&
        (controllers['password']?.value.text ==
            controllers['confirmPassword']?.value.text);

    controllers.forEach((key, value) {
      if (value.value.text.isEmpty) {
        isValid = false;
      }
    });

    return isValid;
  }

  int get passwordLen {
    final password = controllers['password']?.value.text.length;
    return password ?? 0;
  }

  bool get checkEmail {
    final email = controllers['email']?.value;
    if (email != null) {
      return RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9-]+\.[a-zA-Z]+",
      ).hasMatch(email.text);
    }
    return false;
  }

  bool get checkPasswordRequirements {
    final password = controllers['password']?.value.text ?? '';
    return passwordLen <= 0
        ? true
        : RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[!@#\$&*~]).{8,}$')
            .hasMatch(password);
  }

  void validateTextForms() {
    if (formsState != checkCurrentFormState) {
      formsState = checkCurrentFormState;
      notifyListeners();
    }
  }

  void validatePassword() {
    if (isValidPassword != checkPasswordRequirements) {
      isValidPassword = checkPasswordRequirements;
      notifyListeners();
    }
  }
}
