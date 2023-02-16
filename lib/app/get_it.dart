import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../data/api.dart';
import '../data/requests.dart';
import '../data/services/auth_service.dart';
import '../global_variables.dart';
import '../screens/home/home_viewmodel.dart';
import '../screens/register_screen/register_view_model.dart';

final getIt = GetIt.instance;

void setup() {
  getIt
    ..registerFactory(HomeVM.new)
    ..registerLazySingleton(
      () => Dio(BaseOptions()),
    )
    ..registerLazySingleton<Requests>(() => Requests(dio: getIt<Dio>()))
    ..registerLazySingleton(() => Api(getIt<Requests>()))
    ..registerLazySingleton(
      () => AuthService(
        requests: Requests(dio: Dio(BaseOptions(baseUrl: baseAuthUrl))),
      ),
    )
    ..registerFactory(() => RegisterViewModel(authServices: getIt()));
}
