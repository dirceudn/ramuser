
import 'package:equatable/equatable.dart';
import 'package:ranuser/core/home/api/model/users_reponse.dart';

abstract class UserState extends Equatable {
  const UserState();
}


class UsersEmpty extends UserState {
  const UsersEmpty();

  @override
  List<Object?> get props => ['UsersEmpty'];
}

class UsersLoading extends UserState {
  //we can pass an exception message as well
  const UsersLoading();

  @override
  List<Object?> get props => ['UsersLoading'];
}

class UserLoadFailed extends UserState {

  @override
  List<Object?> get props => ['UserLoadFailed'];
}

class UserLoadedSuccessFull extends UserState {

  final List<User>? users;
  const UserLoadedSuccessFull({required this.users});

  @override
  List<Object?> get props => ['UserLoadedSuccessFull'];
}
