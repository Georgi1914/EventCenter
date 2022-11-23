import 'package:get_it/get_it.dart';

import '../screens/home/home_viewmodel.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerFactory(HomeVM.new);
}
