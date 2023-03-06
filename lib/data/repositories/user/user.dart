import '../../../app/auth/local_storage.dart';
import '../../../models/ui/user_model_data.dart';
import '../../services/auth_service.dart';
import 'user_interface.dart';

class UserRepo implements UserRepositoryInterface {
  final AuthService _service;
  final LocalStorage _storage;

  UserRepo({
    required AuthService service,
    required LocalStorage storage,
  })  : _service = service,
        _storage = storage;

  @override
  Future<void> registerUser(UserDataModel user) async => _service.signUp(user);

  @override
  Future<bool> signIn(String email, String password) async {
    final String? token = await _service.signIn(email, password);
    if (token != null) {
      await _storage.storeToken(token);
      return true;
    }
    return false;
  }

  @override
  Future<void> signOut() async {
    await _storage.removeToken();
  }

  @override
  Future<List<int>> getFavoriteIds() async {
    final me = await _service.getMe();
    final List<int> ids = [];
    final favorites = me?.favoriteEvents;
    if (favorites != null) {
      for (final element in favorites) {
        ids.add(element.id);
      }
    }
    return ids;
  }
}
