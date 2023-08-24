// What dose the class depend on
// Answer -- AuthenticationRepository
// how can we create a fake version of the dependency
// Answer -- Use Mocktail
// How do we control what our dependencies do
// Answer -- Use the Mocktail's APIs

import 'package:bloc_clear_architecture/src/authentication/domain/repositories/authentication_repository.dart';
import 'package:bloc_clear_architecture/src/authentication/domain/usecases/create_user.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRepo extends Mock implements AuthenticationRepository {}

void main() {
  late CreateUser usecase;
  late AuthenticationRepository repository;

  setUp(() {
    repository = MockAuthRepo();
    usecase = CreateUser(repository);
  });

  const params = CreateUserParams.empty();

  test(
    'should call the [AuthRepo.createUser]',
    () async {
      // arrange
      when(
        () => repository.createUser(
          createdAt: any(named: 'createdAt'),
          name: any(named: 'name'),
          avatar: any(named: 'avatar'),
        ),
      ).thenAnswer((_) async => const Right(null));
      // act
      final result = await usecase(params);
      // assert
      expect(result, equals(const Right<dynamic, void>(null)));
      verify(
        () => repository.createUser(
          createdAt: params.createAt,
          name: params.name,
          avatar: params.avatar,
        ),
      ).called(1);

      verifyNoMoreInteractions(repository);
    },
  );
}
