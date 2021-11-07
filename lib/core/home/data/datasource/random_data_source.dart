import 'package:dio/dio.dart';
import 'package:ranuser/common/http_base_exception.dart';
import 'package:ranuser/common/log.dart';
import 'package:ranuser/core/home/api/model/users_reponse.dart';
import 'package:ranuser/core/home/api/network/random_api.dart';
import 'package:ranuser/core/home/data/datasource/random_data_source_contract.dart';

class RandomDataSource implements RandomDataSourceContract {
  late List<User>? listOfUsers = [];

  @override
  Future<List<User>?> getUserFromRandomApi() async {
    try {
      final client = RandomApiClient(
        client: Dio(),
        exceptionWrapper: <T>(Response<T> response, exception) {
          final data = response.data;
          if (data != null && data is Map<String, dynamic>) {
            return RandomApiClientException(
              message: data['message'] ?? 'Error message by default',
              exception: exception,
            );
          }
        },
      );

      var response = await client.get<Map<String, dynamic>>(
          "https://randomapi.com/api/61841g64?key=Z2X1-2MDS-HLQW-ISMG&seed=random&results=25");
      var jsonBody = response.data;
      print("body $jsonBody");
      if (jsonBody != null) {
         listOfUsers =  Result.fromJson(jsonBody).results;
      } 
    } on RandomApiClientException catch (exception) {
      logger.e('Exception $exception');
    }
    return listOfUsers;
  }
}
