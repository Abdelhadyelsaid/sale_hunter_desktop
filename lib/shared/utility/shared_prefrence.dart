import 'package:provider/provider.dart';
import 'package:sale_hunter/providers/storeData.dart';
import 'package:sale_hunter/providers/userData.dart';
import 'package:sale_hunter/shared/network/Login/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {

  Future<bool> saveUser(User user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('name',user.fullname);
    prefs.setString('email',user.email);
    prefs.setString('password', user.password);
    return prefs.commit();

  }

  Future<User> getUser ()  async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String name = prefs.getString("name");
    String email = prefs.getString("email");

    return User(
        fullname: name,
        email: email,);

  }

  void removeUser() async {

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('name');
    prefs.remove('email');

  }

  Future<String> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token");
    return token;
  }


}