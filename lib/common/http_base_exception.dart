class HttpClientException<T extends Exception> implements Exception {
  HttpClientException({required this.exception});

  final T exception;
}

enum NetworkErrorReason { canceled, timedOut, responseError }

class NetworkException<T extends Exception> extends HttpClientException<T> {
  final NetworkErrorReason reason;

  NetworkException({
    required this.reason,
    required T exception,
  }) : super(exception: exception);
}

class NetworkResponseException<T extends Exception, Type>
    extends NetworkException<T> {
  NetworkResponseException({
    required T exception,
    this.statusCode,
    this.data,
  }) : super(
          reason: NetworkErrorReason.responseError,
          exception: exception,
        );

  final Type? data;

  final int? statusCode;

  bool get hasData => data != null;
}

class RandomApiClientException extends NetworkResponseException {
  RandomApiClientException({
    required this.message,
    required Exception exception,
  }) : super(exception: exception);

  final String message;
}

