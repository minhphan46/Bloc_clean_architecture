import 'package:bloc_clear_architecture/core/usecase/usecase.dart';
import 'package:bloc_clear_architecture/core/utils/typedef.dart';
import 'package:bloc_clear_architecture/src/authentication/domain/entities/user.dart';
import 'package:bloc_clear_architecture/src/authentication/domain/repositories/authentication_repository.dart';

class CreateUser extends UsecaseWithoutParams<List<User>> {
  const CreateUser(this._repository);

  final AuthenticationRepository _repository;

  @override
  ResultFuture<List<User>> call() async => _repository.getUsers();
}
