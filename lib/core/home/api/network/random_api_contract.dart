import 'package:ranuser/core/home/api/model/users_reponse.dart';

abstract class RandomApiContract {
  Future<Result> getUsers();
}
