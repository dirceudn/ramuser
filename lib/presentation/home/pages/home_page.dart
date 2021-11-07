import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ranuser/core/home/api/model/users_reponse.dart';
import 'package:ranuser/core/home/bloc/bloc.dart';
import 'package:ranuser/presentation/coreui/loading_indicator.dart';
import 'package:ranuser/presentation/coreui/no_data_found.dart';
import 'package:ranuser/presentation/coreui/user_item.dart';
import 'package:ranuser/presentation/user/views/user_profile_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    BlocProvider.of<HomeBloc>(context).add(FetchUsers());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, UserState>(
      builder: (context, state) {
        if (state is UsersLoading) {
          return ProgressIndicator();
        }
        if (state is UserLoadFailed) {
          return UsersNotFound();
        }
        if (state is UserLoadedSuccessFull) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              centerTitle: true,
              title: const Text('Random users',
                  style: TextStyle(color: Colors.blueAccent)),
              elevation: 0,
              backgroundColor: Colors.white,
            ),
            body: Column(
              children: <Widget>[
                Expanded(
                  child: UserContent(state.users),
                )
              ],
            ),
          );
        }
        return ProgressIndicator();
      },
    );
  }
}

// ignore: non_constant_identifier_names
Widget UserContent(List<User>? users) => ListView.builder(
    padding: const EdgeInsets.all(8),
    itemCount: users?.length,
    itemBuilder: (BuildContext context, int index) {
      return GestureDetector(
        onTap: () => {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => UserProfile(
                    email: users?[index].contact.email ?? "-",
                    name: users?[index].name ?? "-",
                    photo: users?[index].photo ?? "-",
                    contact: users?[index].contact)),
          )
        },
        child: UserItem(
            users?[index].id ?? "-",
            users?[index].name ?? "-",
            users?[index].photo ?? "-",
            users?[index].contact.phoneNumber ?? "-"),
      );
    });

Widget ProgressIndicator() {
  return Container(
    color: Colors.white,
    child: Align(
      alignment: Alignment.center,
      child: Center(
        child: LoadingIndicator(typeIndicator: CircularProgressType()),
      ),
    ),
  );
}

Widget UsersNotFound() {
  return const NoDataFound("Users not found");
}
