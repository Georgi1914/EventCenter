import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

import '../data/api.dart';
import '../data/repositories/category/category.dart';
import '../data/repositories/category/category_repository_mappers.dart';
import '../data/repositories/events/event.dart';
import '../data/repositories/events/event_repository_mappers.dart';
import '../data/repositories/user/user.dart';
import '../data/requests.dart';
import '../data/services/auth_service.dart';
import '../global_variables.dart';
import '../screens/create_event_screen/create_event_view_model.dart';
import '../screens/description_screen/description_view_model.dart';
import '../screens/favorite_screen/favorite_view_model.dart';
import '../screens/home/home_viewmodel.dart';
import '../screens/login_screen/login_view_model.dart';
import '../screens/navigation_bar/nav_bar_view_model.dart';
import '../screens/register_screen/register_view_model.dart';
import 'auth/auth_interceptor.dart';
import 'auth/local_storage.dart';

final getIt = GetIt.instance;

void setup() {
  getIt
    ..registerFactory(() => HomeVM(eventRepo: getIt(), categoryRepo: getIt()))
    ..registerLazySingleton(
      () => Dio(BaseOptions(baseUrl: baseURL))
        ..interceptors.add(AuthInterceptor(storage: getIt())),
    )
    ..registerLazySingleton<LocalStorage>(
      () => LocalStorage(
        secureStorage: const FlutterSecureStorage(),
      ),
    )
    ..registerLazySingleton<Requests>(() => Requests(dio: getIt()))
    ..registerLazySingleton(() => Api(requests: getIt()))
    ..registerLazySingleton(() => EventRepo(api: getIt(), mappers: getIt()))
    ..registerLazySingleton(() => CategoryRepo(api: getIt(), mappers: getIt()))
    ..registerLazySingleton(EventRepoMappers.new)
    ..registerLazySingleton(CategoryRepoMappers.new)
    ..registerLazySingleton(
      () => AuthService(
        requests: getIt(),
      ),
    )
    ..registerFactory(() => RegisterViewModel(authServices: getIt()))
    ..registerLazySingleton(
      () => UserRepo(service: getIt(), storage: getIt()),
    )
    ..registerFactory(() => FavoriteVM(userRepo: getIt(), eventRepo: getIt()))
    ..registerFactory(() => LoginViewModel(repo: getIt()))
    ..registerFactory(NavBarVM.new)
    ..registerFactory(CreateEventVM.new)
    ..registerFactory(DescriptionVM.new);
}
