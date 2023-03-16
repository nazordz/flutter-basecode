import 'package:get/get.dart';
import 'package:gooritabasecode/app/data/model/user.dart';
import 'package:gooritabasecode/config/cache_manager.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class AuthenticationService extends GetxService with CacheManager {
  final isLogged = false.obs;
  final Rxn<User> user = Rxn<User>();

  void logOut() {
    isLogged.value = false;
    removeToken();
  }

  Future<void> login(String token, String refreshToken) async {
    isLogged.value = true;
    await Future.wait([saveToken(token), saveRefreshToken(refreshToken)]);
  }

  Future<User?> getUser() async {
    final token = await getToken();
    if (token != null) {
      var decodedToken = JwtDecoder.decode(token);
      return User.fromJson(decodedToken['user']);
    }

    return null;
  }

  Future<bool> checkLoginStatus() async {
    final token = await getToken();
    if (token != null) {
      isLogged.value = true;
      return true;
    }
    return false;
  }

  Future<AuthenticationService> init() async {
    var statusLogin = await checkLoginStatus();
    if (statusLogin) {
      isLogged.value = true;
      var takeUser = await getUser();
      if (takeUser != null) {
        user.value = takeUser;
      }
    }
    return this;
  }
}
