import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ranuser/common/http_base_exception.dart';
import 'package:ranuser/core/home/bloc/bloc.dart';
import 'package:ranuser/core/home/domain/usecase/get_users_usecase.dart';

class HomeBloc extends Bloc<UserEvent, UserState> {
  final GetUsersUseCase usersUseCase;

  HomeBloc({required this.usersUseCase}) : super(UsersEmpty());

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is FetchUsers) {
      yield* _requestUsers();
    }
  }

  Stream<UserState> _requestUsers() async* {
    yield const UsersLoading();
    try {
      var listOfUsers = (await usersUseCase.execute()).users;
      if (listOfUsers != null && listOfUsers.isEmpty) {
        yield const UsersEmpty();
      } else {
        yield UserLoadedSuccessFull(users: listOfUsers);
      }
    } on NetworkResponseException catch (_) {
      yield UserLoadFailed(); // we can pass the exception to show the error message if needed
    }
  }
}
