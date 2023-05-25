import 'dart:convert';

import '../../models/network/user_fav.dart';
import '../../models/ui/user_model_data.dart';
import '../requests.dart';

class AuthService {
  final Requests _requests;

  AuthService({required Requests requests}) : _requests = requests;

  String exceptionMessage = '';

  UserFav? currentUser;

  Future<String?> signIn(String email, String password) async {
    try {
      final response = await _requests.postRequest(
        '/api/auth/local',
        jsonEncode({'identifier': email, 'password': password}),
      );
      if (response.statusCode == 200) {
        return response.data['jwt'];
      }
    } on Exception catch (e) {
      exceptionMessage = e.toString();
    }
    return null;
  }

  Future<void> signUp(UserDataModel user) async {
    try {
      final response = await _requests.postRequest(
        '/api/auth/local/register',
        jsonEncode({
          'username': user.email,
          'email': user.email,
          'password': user.password,
          'firstName': user.firstName,
          'lastName': user.lastName
        }),
      );
      if (response.statusCode != 200) {
        exceptionMessage = response.data.toString();
      }
    } on Exception catch (e) {
      exceptionMessage = e.toString();
    }
  }

  Future<UserFav?> getMe({bool? refetch}) async {
    try {
      if (currentUser != null && refetch != true) {
        return currentUser;
      }

      final Map<String, String> queryParams = {'populate': 'favoriteEvents'};
      final response =
          await _requests.getRequest('/api/users/me', queryParams: queryParams);

      return currentUser = UserFav.fromJson(response);
    } on Exception catch (e) {
      print(e.toString());
    }
    return null;
  }

  void removeCurrentUser() => currentUser = null;
}
