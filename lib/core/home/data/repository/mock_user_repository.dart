import 'package:ranuser/core/home/api/model/users_reponse.dart';
import 'package:ranuser/core/home/domain/repository/user_repository.dart';

  var mockUser = <User>[
    const User(
        "random",
        "fc15e76a1379a75f7473",
        Contact("980 Kozey Plains", "New Vella", "Ecuador",
            "Brent_Blick98@hotmail.com", "(712) 594-1722"),
        "Mrs. Mandy Sauer",
        45,
        "http://lorempixel.com/640/480/cats"),
    const User(
        "random",
        "fc15e76a1379a75f7473",
        Contact("980 Kozey Plains", "New Vella", "Ecuador",
            "Brent_Blick98@hotmail.com", "(712) 594-1722"),
        "Mrs. Mandy Sauer",
        45,
        "http://lorempixel.com/640/480/cats"),
    const User(
        "random",
        "fc15e76a1379a75f7473",
        Contact("980 Kozey Plains", "New Vella", "Ecuador",
            "Brent_Blick98@hotmail.com", "(712) 594-1722"),
        "Mrs. Mandy Sauer",
        45,
        "http://lorempixel.com/640/480/cats"),
    const User(
        "random",
        "fc15e76a1379a75f7473",
        Contact("980 Kozey Plains", "New Vella", "Ecuador",
            "Brent_Blick98@hotmail.com", "(712) 594-1722"),
        "Mrs. Mandy Sauer",
        45,
        "http://lorempixel.com/640/480/cats"),
    const User(
        "random",
        "fc15e76a1379a75f7473",
        Contact("980 Kozey Plains", "New Vella", "Ecuador",
            "Brent_Blick98@hotmail.com", "(712) 594-1722"),
        "Mrs. Mandy Sauer",
        45,
        "http://lorempixel.com/640/480/cats"),
    const User(
        "random",
        "fc15e76a1379a75f7473",
        Contact("980 Kozey Plains", "New Vella", "Ecuador",
            "Brent_Blick98@hotmail.com", "(712) 594-1722"),
        "Mrs. Mandy Sauer",
        45,
        "http://lorempixel.com/640/480/cats"),
    const User(
        "random",
        "fc15e76a1379a75f7473",
        Contact("980 Kozey Plains", "New Vella", "Ecuador",
            "Brent_Blick98@hotmail.com", "(712) 594-1722"),
        "Mrs. Mandy Sauer",
        45,
        "http://lorempixel.com/640/480/cats"),
  ];

class MockUserRepository implements UserRepository {

  @override
  Future<List<User>?> getUsers() async {
    return Future.delayed(const Duration(seconds: 2), () => [...mockUser]);
  }
}
