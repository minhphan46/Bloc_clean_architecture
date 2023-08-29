import 'package:bloc_clear_architecture/src/authentication/data/datasources/authenrication_remote_data_source.dart';
import 'package:bloc_clear_architecture/src/authentication/data/repositories/authentication_repository_impl.dart';
import 'package:bloc_clear_architecture/src/authentication/domain/repositories/authentication_repository.dart';
import 'package:bloc_clear_architecture/src/authentication/domain/usecases/create_user.dart';
import 'package:bloc_clear_architecture/src/authentication/domain/usecases/get_user.dart';
import 'package:bloc_clear_architecture/src/authentication/presentation/cubit/authentication_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  sl
  // app logic
    ..registerFactory(
      () => AuthenticationCubit(createUser: sl(), getUsers: sl()),
    )
    // use cases
    ..registerLazySingleton(() => CreateUser(sl()))
    ..registerLazySingleton(() => GetUsers(sl()))
    // repositories
    ..registerLazySingleton<AuthenticationRepository>(
      () => AuthenticationRepositoryImpl(sl()),
    )
    // data sources
    ..registerLazySingleton<AuthenticationRemoteDataSource>(
      () => AuthRemoteDataSrcImpl(sl()),
    )
    // external dependencies
    ..registerLazySingleton(http.Client.new);
}
