import 'package:bloc_clear_architecture/core/usecase/usecase.dart';
import 'package:bloc_clear_architecture/core/utils/typedef.dart';
import 'package:bloc_clear_architecture/src/authentication/domain/repositories/authentication_repository.dart';
import 'package:equatable/equatable.dart';

class CreateUser extends UsecaseWithParams<void, CreateUserParams> {
  const CreateUser(this._repository);

  final AuthenticationRepository _repository;

  @override
  ResultVoid call(CreateUserParams params) async => _repository.createUser(
        createdAt: params.createAt,
        name: params.name,
        avatar: params.avatar,
      );
}

class CreateUserParams extends Equatable {
  final String createAt;
  final String name;
  final String avatar;

  const CreateUserParams({
    required this.createAt,
    required this.name,
    required this.avatar,
  });

  const CreateUserParams.empty()
      : this(
          createAt: "_empty.createAt",
          name: "_empty.name",
          avatar: "_empty.avatar",
        );

  @override
  List<Object?> get props => [createAt, name, avatar];
}
