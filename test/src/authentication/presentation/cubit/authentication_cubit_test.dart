import 'package:bloc_clear_architecture/src/authentication/domain/usecases/create_user.dart';
import 'package:bloc_clear_architecture/src/authentication/domain/usecases/get_user.dart';
import 'package:bloc_clear_architecture/src/authentication/presentation/cubit/authentication_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGetUser extends Mock implements GetUsers {}

class MockCreateUser extends Mock implements CreateUser {}

void main() {
  late GetUsers getUsers;
  late CreateUser createUser;
  late AuthenticationCubit cubit;

  setUp(() {
    getUsers = MockGetUser();
    createUser = MockCreateUser();
    cubit = AuthenticationCubit(
      createUser: createUser,
      getUsers: getUsers,
    );
  });

  tearDown(() => cubit.close());

  test('initial state should be AuthenticationInitial', () {
    expect(cubit.state, const AuthenticationInitial());
  });
}
