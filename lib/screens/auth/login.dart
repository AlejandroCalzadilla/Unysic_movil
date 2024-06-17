

import 'package:apinestjs/widgets/auth_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:apinestjs/service/auht_service.dart'; // Necesario para TextInputFormatter
import 'package:apinestjs/ui/input_decorations.dart';
class LoginScreen extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginScreen({super.key});
 
  void _login(BuildContext context) async {
    final username = _usernameController.text;
    final password = _passwordController.text;
     LoginService login = LoginService(); 
    final int usernamefinal = int.parse(username);
    bool success = await login.Login(usernamefinal, password);
    if (success) {
  

      Navigator.pushNamed(context, '/secondPage');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Invalid credentials'),
      ));
    }
  }

  bool _authenticate(String username, String password) {
    // Simulación de autenticación
     print(username);
    return username == '219124450' && password == '12345678';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(

      //   title: const Text('Login'),
      // ),
     body: AuthBackground(
         // Color de fondo del body
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          
          child: 
           Column(
             
            mainAxisAlignment: MainAxisAlignment.center,
            
            children: <Widget>[
             const SizedBox(height: 100,),
              TextField(
                controller: _usernameController,
               decoration: InputDecorations.authInputDecoration(
                hintText: '48579482',
                labelText: 'codigo',
                prefixIcon: Icons.alternate_email_rounded
              ),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
              ),
              TextField(
                controller: _passwordController,
                 decoration: InputDecorations.authInputDecoration(
                hintText: '********',
                labelText: 'Contraseña',
                prefixIcon: Icons.lock_outline
              ),
                obscureText: true,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _login(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Cambia el color de fondo del botón aquí
                ),
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
