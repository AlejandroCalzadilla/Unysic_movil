import 'dart:ffi';

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
    const String url = '${Enviroment.api}login'; // Reemplaza con tu URL
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
      //print('Success: $data');
      return true; // Indica que la autenticación fue exitosa
    } else {
      // Maneja los errores
      //print('Error: ${response.statusCode}');
      return false; // Indica que hubo un error en la autenticación
    }
  }


   Future<http.Response> createAsistencia(String hora, String estado, String fecha, int grupoId, double latitud, double longitud) async {
  var queryParams = {
    'latitud': latitud.toString(),
    'longitud': longitud.toString(),
  };
   
   print('$latitud $longitud  esto esta mandando');

   const String url = '${Enviroment.api}login';
  var uri = Uri.http('18.218.118.43', '/api/asistencias', queryParams); // Reemplaza con la URL de tu servidor
    final token = await storage.read(key: 'jwt');
  //final uri = Uri.parse(url);
  return http.post(
    uri,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8','Authorization': 'Bearer $token',

    },
    body: jsonEncode(<String, dynamic>{
      'hora': hora,
      'estado': estado,
      'fecha': fecha,
      'grupo': {
        'id': grupoId
      },
    }),
  );
}

   


 Future<http.Response> licencia(String hora, String estado, String fecha, int grupoId) async {
    const String url = '${Enviroment.api}api/asistencias/registrar'; // Reemplaza con tu URL
    final uri = Uri.parse(url);
    final token = await storage.read(key: 'jwt');
    /* final Map<String, dynamic> body = {
     
    }; */

    return  await http.post(
      uri,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(<String, dynamic>{
      'hora': hora,
      'estado': estado,
      'fecha': fecha,
      'grupo': {
        'id': grupoId
      },
    }),
    );

    
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
