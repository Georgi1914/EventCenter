import '../../../models/ui/user_model_data.dart';

abstract class UserRepositoryInterface {
  Future<void> registerUser(UserDataModel user);
  Future<bool> signIn(String email, String password);
  Future<void> signOut();
}
