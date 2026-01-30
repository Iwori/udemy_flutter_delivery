import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_flutter_delivery/src/presentation/controllers/login_controller.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  LoginController con = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [_backgroundCover(context, size), _content(context, size)],
        ),
      ),
    );
  }

  // 1. Fondo Amarillo (60% superior)
  Widget _backgroundCover(BuildContext context, Size size) {
    return Container(
      width: double.infinity,
      height: size.height * 0.40,
      color: Colors.amber,
    );
  }

  // 2. Contenido con Scroll y SafeArea
  Widget _content(BuildContext context, Size size) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              _imageBanner(size),
              _textAppName(),
              _boxForm(context, size),
              SizedBox(height: size.height * 0.05), // Espacio dinámico al final
              _textDontHaveAccount(context),
              const SizedBox(height: 20), // Margen extra inferior
            ],
          ),
        ),
      ),
    );
  }

  // Cabecera: Imagen adaptativa (22% de la altura de la pantalla aprox)
  Widget _imageBanner(Size size) {
    return Container(
      margin: EdgeInsets.only(
        top: size.height * 0.08,
        bottom: size.height * 0.02,
      ),
      child: Image.asset(
        'assets/img/delivery.png',
        width: size.width * 0.25,
        height: size.width * 0.25,
      ),
    );
  }

  // Cabecera: Texto
  Widget _textAppName() {
    return const Text(
      'DELIVERY MYSQL',
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
  }

  // Tarjeta Central Adaptativa
  Widget _boxForm(BuildContext context, Size size) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(
        horizontal: size.width * 0.1,
        vertical: size.height * 0.04,
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
          _textFieldPassword(size),
          _buttonLogin(size),
        ],
      ),
    );
  }

  Widget _textFieldEmail(Size size) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.08, vertical: 10),
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

  Widget _textFieldPassword(Size size) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.08, vertical: 10),
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

  Widget _buttonLogin(Size size) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.08, vertical: 30),
      child: ElevatedButton(
        onPressed: () => con.login(),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.amber,
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: const Text(
          'LOGIN',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  // Pie: Texto de registro
  Widget _textDontHaveAccount(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          '¿No tienes cuenta?',
          style: TextStyle(color: Colors.black, fontSize: 17),
        ),
        const SizedBox(width: 7),
        GestureDetector(
          onTap: () => con.goToRegisterPage(),
          child: const Text(
            'Regístrate Aquí',
            style: TextStyle(
              color: Colors.amber,
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
        ),
      ],
    );
  }
}
