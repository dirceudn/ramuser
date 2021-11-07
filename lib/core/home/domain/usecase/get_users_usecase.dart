import 'package:ranuser/common/use_case.dart';
import 'package:ranuser/core/home/api/model/users_reponse.dart';
import 'package:ranuser/core/home/domain/repository/user_repository.dart';

class GetUsersUseCase extends UseCase<Result, Param> {
  final UserRepository userRepository;

  GetUsersUseCase({required this.userRepository});

  //we can improve this use case later if needed
  @override
  Future<Result> execute([Param? param]) async {
    final users = await userRepository.getUsers();
    return Result(users);
  }
}

class Result {
  final List<User>? users;

  const Result(this.users);
}
