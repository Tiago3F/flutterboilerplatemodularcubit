import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Page"),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: (() {
              Modular.to.navigate('/products/red');
            }),
            child: const Text("Entrar")),
      ),
    );
  }
}
