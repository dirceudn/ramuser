import 'package:equatable/equatable.dart';

abstract class UseCase<T, Params> {
  Future<T> _buildUseCaseParams(Params? param);

  execute([Params? param]) => _buildUseCaseParams(param);
}

abstract class Param extends Equatable {}

