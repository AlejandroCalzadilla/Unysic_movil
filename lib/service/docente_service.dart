import 'package:apinestjs/conexion/enviroment.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class DocenteService {
  Enviroment apiurl = Enviroment();
  List<dynamic> usuarios = [];
  final String _url = '${Enviroment.api}api/profesor';
  final storage =const  FlutterSecureStorage();

  Future<List<dynamic>> getGrupos() async {
    final  token = await storage.read(key: 'jwt');
    final String url = '$_url/materias';
    final uri = Uri.parse(url);
    //print('$token devolvio el token o negativo');
    final response = await http.get(
      uri,
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    //final body = response.body;
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data; // Indica que la autenticación fue exitosa
    } else if (response.statusCode == 403) {
      return Future.error('No es docente'); 
    } else {
      return Future.error(
          'Error en la autenticación: ${response.statusCode}'); // Retorna un error genérico
    }
  }


    



  Future<bool> postNumberAndString(int number, String text) async {
    final String url = '${Enviroment.api}login'; // Reemplaza con tu URL
    final uri = Uri.parse(url);
    final token = await storage.read(key: 'jwt');
    final Map<String, dynamic> body = {
      'username': number,
      'password': text,
    };

    final response = await http.post(
      uri,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      // Maneja la respuesta exitosa
      print('Success: $data');
      return true; // Indica que la autenticación fue exitosa
    } else {
      // Maneja los errores
      //print('Error: ${response.statusCode}');
      return false; // Indica que hubo un error en la autenticación
    }
  }
  /*  Future<void> fetchData() async {
    final token = await tokenService.getToken();
    if (token != null) {
      final url = 'http://example.com/protected'; // Reemplaza con tu URL protegida
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        // Maneja la respuesta exitosa
        print('Data: ${response.body}');
      } else {
        // Maneja el error
        print('Error: ${response.statusCode}');
      }
    } else {
      // Maneja el caso en que no hay token
      print('No token found');
    }
  } */
}
