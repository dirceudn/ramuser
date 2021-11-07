import 'package:dio/dio.dart';
import 'package:ranuser/common/http_base_exception.dart';

typedef HttpLibraryMethod<T> = Future<Response<T>> Function();

typedef ExceptionWrapper = NetworkResponseException? Function<T>(
  Response<T>,
  Exception,
);


class RandomApiClient {
  RandomApiClient({required Dio client, this.exceptionWrapper}) : _client = client;

  final Dio _client;

    final ExceptionWrapper? exceptionWrapper;


  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) {
    return _wrapperHttpsException(
      () => _client.get(
        path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      ),
    );
  }

  Future<Response<T>> _wrapperHttpsException<T>(
      HttpLibraryMethod<T> method) async {
    try {
      return await method();
    } on DioError catch (exception) {
      switch (exception.type) {
        case DioErrorType.cancel:
          throw NetworkException(
            reason: NetworkErrorReason.canceled,
            exception: exception,
          );
        case DioErrorType.sendTimeout:
          throw NetworkException(
            reason: NetworkErrorReason.timedOut,
            exception: exception,
          );
        case DioErrorType.response:
          final response = exception.response;
          if (response == null || response is! Response<T>) {
            throw NetworkResponseException(exception: exception);
          }
 
          throw exceptionWrapper?.call(response, exception) ??
              NetworkResponseException(
                exception: exception,
                statusCode: response.statusCode,
                data: response.data,
              );
        default:
          throw HttpClientException(exception: exception);
      }
    } catch (exception) {
      throw HttpClientException(
        exception: exception is Exception ? exception : Exception('Unknown exception ocurred'),
      );
    }
  }
}
