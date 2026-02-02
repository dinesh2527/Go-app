import 'package:get_it/get_it.dart';

import 'features/home/data/datasources/home_local_data_source.dart';
import 'features/home/data/repositories/home_repository_impl.dart';
import 'features/home/domain/repositories/home_repository.dart';
import 'features/home/domain/usecases/get_welcome_message.dart';
import 'features/home/presentation/bloc/home_bloc.dart';
import 'features/auth/presentation/bloc/registration_bloc.dart';
import 'features/permission/presentation/bloc/location_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Features - Home
  // Bloc
  sl.registerFactory(() => HomeBloc(getWelcomeMessage: sl()));

  // Features - Auth
  sl.registerFactory(() => RegistrationBloc());

  // Features - Permission
  sl.registerFactory(() => LocationBloc());

  // Use cases
  sl.registerLazySingleton(() => GetWelcomeMessage(sl()));

  // Repository
  sl.registerLazySingleton<HomeRepository>(
        () => HomeRepositoryImpl(localDataSource: sl()),
  );

  // Data sources
  sl.registerLazySingleton<HomeLocalDataSource>(
        () => HomeLocalDataSourceImpl(),
  );

  // Core
  // External
}
