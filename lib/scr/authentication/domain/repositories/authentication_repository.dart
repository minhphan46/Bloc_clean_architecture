import 'package:bloc_clear_architecture/scr/authentication/domain/entities/user.dart';

abstract class AuthenticationRepository {
  const AuthenticationRepository();

  Future<(Exception, void)> createUser({
    required String createdAt,
    required String name,
    required String avatar,
  });

  Future<(Exception, List<User>)> getUsers();
}
