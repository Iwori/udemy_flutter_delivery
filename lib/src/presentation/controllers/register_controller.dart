import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_flutter_delivery/src/data/models/response_api.dart';
import 'package:udemy_flutter_delivery/src/data/models/user.dart';
import 'package:udemy_flutter_delivery/src/data/providers/users_provider.dart';

class RegisterController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  UsersProvider usersProvider = UsersProvider();

  void register() async {
    String email = emailController.text.trim();
    String name = nameController.text;
    String lastName = lastNameController.text;
    String phone = phoneController.text;
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    if (isValidForm(email, name, lastName, phone, password, confirmPassword)) {
      User user = User(
        email: email,
        name: name,
        lastName: lastName,
        phone: phone,
        password: password,
      );

      ResponseApi responseApi = await usersProvider.create(user);

      if (responseApi.success) {
        Get.snackbar('Registro exitoso', responseApi.message);
        Get.offAllNamed('/'); // Regresar al login
      } else {
        Get.snackbar('Registro fallido', responseApi.message);
      }
    }
  }

  bool isValidForm(String email, String name, String lastName, String phone,
      String password, String confirmPassword) {
    if (email.isEmpty ||
        name.isEmpty ||
        lastName.isEmpty ||
        phone.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {
      Get.snackbar('Formulario no valido', 'Debes ingresar todos los campos');
      return false;
    }
    if (!GetUtils.isEmail(email)) {
      Get.snackbar('Formulario no valido', 'El email no es valido');
      return false;
    }
    if (password != confirmPassword) {
      Get.snackbar('Formulario no valido', 'Los passwords no coinciden');
      return false;
    }
    return true;
  }
}