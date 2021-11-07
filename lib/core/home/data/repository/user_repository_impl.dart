import 'package:ranuser/core/home/api/model/users_reponse.dart';
import 'package:ranuser/core/home/data/datasource/random_data_source.dart';
import 'package:ranuser/core/home/data/datasource/random_data_source_contract.dart';
import 'package:ranuser/core/home/domain/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  late RandomDataSourceContract randomDataSource;

  UserRepositoryImpl({RandomDataSourceContract? randomDataSource}) {
    this.randomDataSource = randomDataSource ?? RandomDataSource();
  }

  @override
  Future<List<User>?> getUsers() async =>
      await randomDataSource.getUserFromRandomApi();
}
