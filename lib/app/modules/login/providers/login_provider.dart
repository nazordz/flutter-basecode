// import 'package:get/get.dart';
import 'package:gooritabasecode/app/data/model/login_response.dart';
import 'package:gooritabasecode/config/http.dart';

class LoginProvider {
  final http = Http();

  Future<LoginResponse?> authenticate(String email, String password) async {
    try {
      var result = await http.post(
        '/authentication/login',
        data: {
          'email': email,
          'password': password,
        },
      );
      return LoginResponse.fromJson(result.data);
    } catch (e) {
      print(e);
      return null;
    }
  }
}
