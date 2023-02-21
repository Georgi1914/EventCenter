import 'dart:convert';

import '../../models/user_model_data.dart';
import '../requests.dart';

class AuthService {
  final Requests _requests;

  AuthService({required Requests requests}) : _requests = requests;

  String exceptionMessage = '';

  Future<bool> signIn(String email, String password) async {
    try {
      final response = await _requests.postRequest(
        '/auth/local',
        jsonEncode({'identifier': email, 'password': password}),
      );
      return response.statusCode == 200;
    } on Exception catch (e) {
      exceptionMessage = e.toString();
      print(exceptionMessage);
    }
    return false;
  }

  Future<void> signUp(UserDataModel user) async {
    try {
      final response = await _requests.postRequest(
        '/auth/local/register',
        jsonEncode({
          'username': user.email,
          'email': user.email,
          'password': user.password,
          'firstName': user.firstName,
          'lastName': user.lastName
        }),
        //todo create model
      );
      if (response.statusCode != 200) {
        exceptionMessage = response.data.toString();
      } else {
        await _requests.postRequest(
          '/auth/email-confirmation',
          jsonEncode({'email': user.email}),
        );
      }
    } on Exception catch (e) {
      exceptionMessage = e.toString();
    }
  }

// Future<void> signOut() async => await auth.signOut();
}
