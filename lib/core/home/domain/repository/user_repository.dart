import 'package:ranuser/core/home/api/model/users_reponse.dart';

abstract class UserRepository {


Future<List<User>?> getUsers();

}