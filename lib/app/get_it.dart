import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../data/api.dart';
import '../data/repositories/events/event.dart';
import '../data/repositories/events/event_repository_mappers.dart';
import '../data/requests.dart';
import '../data/services/auth_service.dart';
import '../global_variables.dart';
import '../screens/home/home_viewmodel.dart';
import '../screens/login_screen/login_view_model.dart';
import '../screens/register_screen/register_view_model.dart';

final getIt = GetIt.instance;

void setup() {
  getIt
    ..registerFactory(() => HomeVM(eventRepo: getIt()))
    ..registerLazySingleton(
      () => Dio(BaseOptions(baseUrl: baseURL)),
    )
    ..registerLazySingleton<Requests>(() => Requests(dio: getIt()))
    ..registerLazySingleton(() => Api(requests: getIt()))
    ..registerLazySingleton(() => EventRepo(api: getIt(), mappers: getIt()))
    ..registerLazySingleton(EventRepoMappers.new)
    ..registerLazySingleton(
      () => AuthService(
        requests: Requests(dio: Dio(BaseOptions(baseUrl: baseURL))),
      ),
    )
    ..registerFactory(() => RegisterViewModel(authServices: getIt()))
    ..registerFactory(() => LoginViewModel(authService: getIt()));
}
