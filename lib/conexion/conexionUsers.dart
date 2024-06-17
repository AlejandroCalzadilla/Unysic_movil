
import 'package:apinestjs/conexion/enviroment.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Usuario {
  Enviroment apiurl=Enviroment();
  List<dynamic> usuarios = [];
   final String _url='${Enviroment.api}pruebamjp/curso';


  Future<List<dynamic>> getUsers() async {
    print('fetchUsers called a ver llego o nel');
    //_url = '_url';
    final uri = Uri.parse(_url);
    final response = await http.get(uri);
    final body = response.body;
    print(body);
     usuarios = jsonDecode(body);
    // print(usuarios,'que tal los usuarios'); 
    return usuarios;
  }
  




  
  Future<dynamic> getUser() async {
     
    try {
      final response = await http.get(Uri.parse('$_url/162001b4-7ac4-43b0-a1c5-0027af958657'));
      print(response);
      if (response.statusCode == 200) {
        print(jsonDecode(response.body));
        return jsonDecode(response.body);
      } else if (response.statusCode == 404) {
        throw Exception('Usuario no encontrado prueba');
      } else {
        throw Exception('Error en la solicitud HTTP: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Error en la solicitud: $error');
    }
  }






}