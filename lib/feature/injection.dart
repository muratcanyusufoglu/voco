import 'package:get_it/get_it.dart';
import 'package:voco/feature/log/log_manager.dart';
import 'package:voco/feature/service/service_manager.dart';
import 'package:voco/product/screens/auth/service/auth_service_repository_impl.dart';
import 'package:voco/product/screens/home/service/home_service_repository_impl.dart';


class Injection {
  static final GetIt getIt = GetIt.instance;

  void initInstances() {
    getIt
      ..registerLazySingleton<ServiceManager>(() => ServiceManager())
      ..registerLazySingleton<LogManager>(() => LogManager())
      // services
      ..registerLazySingleton<AuthServiceRepositoryImpl>(() => AuthServiceRepositoryImpl())
      ..registerLazySingleton<HomeServiceRepositoryImpl>(() => HomeServiceRepositoryImpl());

  }
}
