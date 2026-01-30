import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_flutter_delivery/src/data/models/response_api.dart';
import 'package:udemy_flutter_delivery/src/data/models/user.dart';
import 'package:udemy_flutter_delivery/src/data/providers/users_provider.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  UsersProvider usersProvider = UsersProvider();
  GetStorage storage = GetStorage();

  void login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (isValidForm(email, password)) {
      ResponseApi responseApi = await usersProvider.login(email, password);

      if (responseApi.success) {
        User user = User.fromJson(responseApi.data);
        storage.write('user', user.toJson()); // Guardamos la sesion en el dispositivo
        
        Get.snackbar('Login exitoso', responseApi.message);
        // goToHomePage(); // Proximo paso
      } else {
        Get.snackbar('Login fallido', responseApi.message);
      }
    }
  }

  bool isValidForm(String email, String password) {
    if (email.isEmpty) {
      Get.snackbar('Formulario no valido', 'Debes ingresar el email');
      return false;
    }
    if (!GetUtils.isEmail(email)) {
      Get.snackbar('Formulario no valido', 'El email no es valido');
      return false;
    }
    if (password.isEmpty) {
      Get.snackbar('Formulario no valido', 'Debes ingresar el password');
      return false;
    }
    return true;
  }

  void goToRegisterPage() {
    Get.toNamed('/register');
  }
}
