import 'package:apinestjs/conexion/enviroment.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
class  LoginService {
  Enviroment apiurl=Enviroment();
  List<dynamic> usuarios = [];
   final String _url='${Enviroment.api}login';
  // ignore: non_constant_identifier_names
  Future<bool> Login(int number, String text) async {
    const String url = '${Enviroment.api}login'; // Reemplaza con tu URL
    final uri = Uri.parse(url);

    final Map<String, dynamic> body = {
      'username': number,
      'password': text,
    };

    final response = await http.post(
      uri,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final token = data['token'];
      const storage = FlutterSecureStorage();
     //print('aver es o no el token $token ');
// Write value 
      await storage.write(key: 'jwt', value: token);
      return true; // Indica que la autenticación fue exitosa
    } else {
      //print('Error: ${response.statusCode}');
      return false; // Indica que hubo un error en la autenticación
    }
  }


}