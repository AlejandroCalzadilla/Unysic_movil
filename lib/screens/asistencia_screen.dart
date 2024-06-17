//import 'package:apinestjs/botones_reusables/mensaje404.dart';
import 'package:apinestjs/conexion/conexionUsers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';



class AsistencialScreen extends StatefulWidget {
  const AsistencialScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AsistencialScreenState createState() => _AsistencialScreenState();
}

class _AsistencialScreenState extends State<AsistencialScreen> {
  dynamic user = {}; // Inicializamos user como un objeto vacío
   final storage = FlutterSecureStorage();
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
        title: const Text('Asistencia'),
        
        actions: [
              IconButton(
        icon: const Icon(Icons.exit_to_app),
        onPressed: () async {
        await storage.delete(key: 'jwt');
          final deletedToken = await storage.read(key: 'jwt');
         print('Token eliminado: $deletedToken'); //  
          // ignore: use_build_context_synchronously
          Navigator.pushNamed(context, '/'); 
          // Acción cuando se presiona el botón de configuración
          //print('Presionado el botón de configuración');
        },
      ),

        ],




      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            CardWidget(title: 'marcar asistencia', content: ''),
            SizedBox(height: 16), // Espacio entre las tarjetas
            CardWidget(title: 'pedir licencia', content: ''),
            SizedBox(height: 16), // Espacio entre las tarjetas
            CardWidget(title: 'clases virtuales', content: ''),
          ],
        ),
      ),
    );
  }
}



class CardWidget extends StatelessWidget {
  final String title;
  final String content;

  const CardWidget({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        
        child: Column(
           
           crossAxisAlignment: CrossAxisAlignment.center, // Alineación cruzada centrada
          mainAxisAlignment: MainAxisAlignment.center, // Alineación principal centrada
          children: [

            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold,),
               textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
           /*  Text(
              content,
              style: const TextStyle(fontSize: 16),
               textAlign: TextAlign.center,
               
            ), */
          ],
        ),
      ),
    );
  }
}


  



