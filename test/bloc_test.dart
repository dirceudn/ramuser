import 'package:bloc_test/bloc_test.dart';
import 'package:equatable/equatable.dart';
import 'package:ranuser/core/home/bloc/bloc.dart';
import 'package:ranuser/core/home/data/repository/mock_user_repository.dart';
import 'package:ranuser/core/home/domain/usecase/get_users_usecase.dart';
import 'package:test/test.dart';

void main() {
  group('UserBloc test', () {
    late HomeBloc homeBloc;
    late MockUserRepository mockUserRepository;
    late GetUsersUseCase usersUseCase;

    setUp(() {
      EquatableConfig.stringify = true;
      mockUserRepository = MockUserRepository();
      usersUseCase = GetUsersUseCase(userRepository: mockUserRepository);
      homeBloc = HomeBloc(usersUseCase: usersUseCase);
    });

    blocTest<HomeBloc, UserState>(
      'emits [UserLoadingInProgress, UserLoadedWithSuccess] states for'
      'successful users loads',
      build: () => homeBloc,
      act: (bloc) => bloc.add(const FetchUsers()),
      expect: () => [
        const UsersLoading(),
        UserLoadedSuccessFull(users: mockUser),
      ],
    );

    blocTest<HomeBloc, UserState>(
      'emits [UserEmptyState] states for'
      'emptyState',
      build: () => homeBloc,
      act: (bloc) => bloc.emit(const UsersEmpty()),
      expect: () => [
        const UsersEmpty(),
      ],
    );

    blocTest<HomeBloc, UserState>(
      'emits [null for bloc] states for'
      'empty state',
      build: () => homeBloc,
      act: (bloc) => null,
      expect: () => [],
    );

    tearDown(() {
      homeBloc.close();
    });
  });
}
