import 'package:get/get.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class UserProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = dotenv.env['BASE_API'];
  }
}
