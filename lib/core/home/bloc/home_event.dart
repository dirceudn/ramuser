import 'package:equatable/equatable.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();
}

class FetchUsers extends UserEvent {
  const FetchUsers();

  @override
  List<Object?> get props => ['FetchUsers'];
}
