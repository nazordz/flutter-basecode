import 'package:get/get.dart';
import 'package:gooritabasecode/app/modules/home/user_model.dart';
import 'package:gooritabasecode/config/cache_manager.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class AuthenticationManagerController extends GetxController with CacheManager {
  final isLogged = false.obs;

  void logOut() {
    isLogged.value = false;
    removeToken();
  }

  Future<void> login(String token, String refreshToken) async {
    isLogged.value = true;
    //Token is cached
    await Future.wait([saveToken(token), saveRefreshToken(refreshToken)]);
  }

  Future<User?> getUser() async {
    final token = await getToken();
    if (token != null) {
      var decodedToken = JwtDecoder.decode(token);
      return decodedToken['user'];
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
}
