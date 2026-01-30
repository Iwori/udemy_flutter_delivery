import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_flutter_delivery/src/presentation/controllers/register_controller.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  RegisterController con = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            _backgroundCover(context, size),
            _content(context, size),
            _buttonBack(),
          ],
        ),
      ),
    );
  }

  Widget _buttonBack() {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(left: 15, top: 10),
        child: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 30,
          ),
        ),
      ),
    );
  }

  Widget _backgroundCover(BuildContext context, Size size) {
    return Container(
      width: double.infinity,
      height: size.height * 0.40,
      color: Colors.amber,
    );
  }

  Widget _content(BuildContext context, Size size) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              _imageUser(size),
              _boxForm(context, size),
            ],
          ),
        ),
      ),
    );
  }

  Widget _imageUser(Size size) {
    return Container(
      margin: EdgeInsets.only(
        top: size.height * 0.05,
        bottom: size.height * 0.02,
      ),
      child: CircleAvatar(
        backgroundImage: const AssetImage('assets/img/user_profile.png'),
        radius: size.width * 0.15,
        backgroundColor: Colors.white,
      ),
    );
  }

  Widget _boxForm(BuildContext context, Size size) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(
        horizontal: size.width * 0.1,
        vertical: size.height * 0.02,
      ),
      padding: const EdgeInsets.symmetric(vertical: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 15,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          const Text(
            'INGRESA ESTA INFORMACION',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 30),
          _textFieldEmail(size),
          _textFieldName(size),
          _textFieldLastName(size),
          _textFieldPhone(size),
          _textFieldPassword(size),
          _textFieldConfirmPassword(size),
          _buttonRegister(size),
        ],
      ),
    );
  }

  Widget _textFieldEmail(Size size) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.08, vertical: 5),
      child: TextField(
        controller: con.emailController,
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
          hintText: 'Correo electrónico',
          prefixIcon: Icon(Icons.email, color: Colors.amber),
        ),
      ),
    );
  }

  Widget _textFieldName(Size size) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.08, vertical: 5),
      child: TextField(
        controller: con.nameController,
        keyboardType: TextInputType.text,
        decoration: const InputDecoration(
          hintText: 'Nombre',
          prefixIcon: Icon(Icons.person, color: Colors.amber),
        ),
      ),
    );
  }

  Widget _textFieldLastName(Size size) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.08, vertical: 5),
      child: TextField(
        controller: con.lastNameController,
        keyboardType: TextInputType.text,
        decoration: const InputDecoration(
          hintText: 'Apellido',
          prefixIcon: Icon(Icons.person_outline, color: Colors.amber),
        ),
      ),
    );
  }

  Widget _textFieldPhone(Size size) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.08, vertical: 5),
      child: TextField(
        controller: con.phoneController,
        keyboardType: TextInputType.phone,
        decoration: const InputDecoration(
          hintText: 'Teléfono',
          prefixIcon: Icon(Icons.phone, color: Colors.amber),
        ),
      ),
    );
  }

  Widget _textFieldPassword(Size size) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.08, vertical: 5),
      child: TextField(
        controller: con.passwordController,
        keyboardType: TextInputType.text,
        obscureText: true,
        decoration: const InputDecoration(
          hintText: 'Contraseña',
          prefixIcon: Icon(Icons.lock, color: Colors.amber),
        ),
      ),
    );
  }

  Widget _textFieldConfirmPassword(Size size) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.08, vertical: 5),
      child: TextField(
        controller: con.confirmPasswordController,
        keyboardType: TextInputType.text,
        obscureText: true,
        decoration: const InputDecoration(
          hintText: 'Confirmar Contraseña',
          prefixIcon: Icon(Icons.lock_outline, color: Colors.amber),
        ),
      ),
    );
  }

  Widget _buttonRegister(Size size) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.08, vertical: 30),
      child: ElevatedButton(
        onPressed: () => con.register(),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.amber,
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: const Text(
          'REGISTRARSE',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}