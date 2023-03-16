import 'package:flutter/cupertino.dart';

import '../../data/repositories/user/user.dart';

class ProfileVM extends ChangeNotifier {
  final UserRepo _userRepo;

  ProfileVM({required UserRepo userRepo}) : _userRepo = userRepo;

  void signOut() {
    _userRepo.signOut();
  }
}
