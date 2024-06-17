//import 'package:apinestjs/botones_reusables/mensaje404.dart';
import 'package:apinestjs/conexion/conexionUsers.dart';
import 'package:flutter/material.dart';



class UserDetailScreen extends StatefulWidget {
  const UserDetailScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _UserDetailScreenState createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends State<UserDetailScreen> {
  dynamic user = {}; // Inicializamos user como un objeto vacío

  @override
  void initState() {
    super.initState();
    fetUsers();
  }

  void fetUsers() async {
    try {
      // Llamamos a la función getUser con el ID proporcionado
      Usuario usuario = Usuario();
      user = await usuario.getUser();     
      // Llamamos a setState para actualizar el widget con los nuevos datos del usuario

      setState(() {});
    } catch (error) {
     // Error404Widget error= Error404Widget(); 
      
      print('Error al obtener el usuario : $error');
    }
  }

 

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalles del Usuario'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Card(
          elevation: 5, // Ajusta la elevación según sea necesario
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'hola',
                  //'Nombre: ${user['nombre']}',
                  style:TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
 
                // const SizedBox(height: 8),
                /* Text(
                  'Fecha de Creación: ${user['createdAt']}',
                  style: TextStyle(fontSize: 16),
                ), */
                // Agrega más detalles según sea necesario
              ],
            ),
          ),
        ),
      ),
    );
  }
}


  



