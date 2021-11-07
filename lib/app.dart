import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ranuser/core/home/bloc/bloc.dart';
import 'package:ranuser/core/home/data/repository/user_repository_impl.dart';
import 'package:ranuser/core/home/domain/repository/user_repository.dart';
import 'package:ranuser/core/home/domain/usecase/get_users_usecase.dart';
import 'package:ranuser/presentation/home/pages/home_page.dart';

class AppPage extends StatelessWidget {
  final UserRepository userRepository = UserRepositoryImpl();


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return _buildBlocProvider(userRepository);
  }
}

MultiBlocProvider _buildBlocProvider(UserRepository userRepository) {
  final GetUsersUseCase usersUseCase =
      GetUsersUseCase(userRepository: userRepository);
  return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
          create: (BuildContext context) =>
              HomeBloc(usersUseCase: usersUseCase),
        )
      ],
      child: const MaterialApp(
          home: HomePage(title: " this"), routes: <String, WidgetBuilder>{}));
}
