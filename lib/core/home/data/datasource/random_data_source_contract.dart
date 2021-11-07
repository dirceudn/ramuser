import 'package:ranuser/core/home/api/model/users_reponse.dart';

abstract class RandomDataSourceContract {
  Future<List<User>?> getUserFromRandomApi();
}
