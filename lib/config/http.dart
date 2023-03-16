import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:jwt_decoder/jwt_decoder.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:warehouse_operation_apps/api/model/user.dart';
// import 'package:warehouse_operation_apps/config/navigator_key.dart';

class Http extends DioForNative {
  Http() {
    options.baseUrl = dotenv.env['BASE_API']!;
    // interceptors.add(CustomInterceptors());
  }
}

class AuthenticatedInterceptors extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // if (prefs.getString("token") != null) {
    //   options.headers['authorization'] = 'Bearer ${prefs.getString("token")}';
    // }

    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return handler.next(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    // if (err.response?.statusCode == 401) {
    //   var res = jsonDecode(err.response.toString());
    //   if (res['status'] == 'TOKEN_FAILED' || res['status'] == 'TOKEN_EXPIRED') {
    //     var notExpired = await refreshToken();
    //     if (notExpired) {
    //       SharedPreferences prefs = await SharedPreferences.getInstance();
    //       err.requestOptions.headers['Authorization'] =
    //           'Bearer ${prefs.getString("token")}';

    //       final opts = Options(
    //           method: err.requestOptions.method,
    //           headers: err.requestOptions.headers);
    //       final cloneReq = await Http().request(err.requestOptions.path,
    //           options: opts,
    //           data: err.requestOptions.data,
    //           queryParameters: err.requestOptions.queryParameters);
    //       handler.resolve(cloneReq);
    //     } else {
    //       navigatorKey.currentState!.pushReplacementNamed("/login");
    //     }
    //   }
    // }
    return super.onError(err, handler);
  }

  // Future<bool> refreshToken() async {
  //   try {
  //     SharedPreferences prefs = await SharedPreferences.getInstance();
  //     final refreshToken = prefs.getString('refresh_token');

  //     final response =
  //         await Http().post('refresh', data: {'token': refreshToken});

  //     if (response.statusCode == 200) {
  //       Map<String, dynamic> decodedToken =
  //           JwtDecoder.decode(response.data['access_token']);
  //       User user = User.fromJson(decodedToken['data']);
  //       prefs.setString('user', jsonEncode(user));
  //       prefs.setString('token', response.data['access_token']);
  //       prefs.setString('refresh_token', response.data['refresh_token']);
  //       prefs.setString('role', user.roles![0].name);
  //       return true;
  //     }
  //     return false;
  //   } catch (e) {
  //     return false;
  //   }
  // }
}
