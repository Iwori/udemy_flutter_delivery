import 'package:get/get.dart';
import 'package:udemy_flutter_delivery/src/config/environment.dart';
import 'package:udemy_flutter_delivery/src/data/models/response_api.dart';
import 'package:udemy_flutter_delivery/src/data/models/user.dart';

class UsersProvider extends GetConnect {
  String url = "${Environment.API_URL}/api/users";

  Future<ResponseApi> create(User user) async {
    Response response = await post('$url/create', user.toJson(), headers: {
      'Content-Type': 'application/json'
    }); // POST

    if (response.body == null) {
      Get.snackbar('Error', 'No se pudo procesar la peticion');
      return ResponseApi(success: false, message: 'Error');
    }

    return ResponseApi.fromJson(response.body);
  }

  Future<ResponseApi> login(String email, String password) async {
    Response response = await post('$url/login', {
      'email': email,
      'password': password
    }, headers: {
      'Content-Type': 'application/json'
    }); // POST

    if (response.body == null) {
      Get.snackbar('Error', 'No se pudo procesar la peticion');
      return ResponseApi(success: false, message: 'Error');
    }

    return ResponseApi.fromJson(response.body);
  }
}
