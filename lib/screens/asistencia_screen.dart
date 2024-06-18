//import 'package:apinestjs/botones_reusables/mensaje404.dart';


import 'dart:ffi';

import 'package:apinestjs/conexion/conexionUsers.dart';
import 'package:apinestjs/service/docente_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:apinestjs/service/docente_service.dart';
//import 'package:intl/date_symbol_data_local.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter_secure_storage/flutter_secure_storage.dart';
//import 'package:geolocator/geolocator.dart';

class AsistencialScreen extends StatefulWidget {
  const AsistencialScreen({super.key});

  @override
  _AsistencialScreenState createState() => _AsistencialScreenState();
}

class _AsistencialScreenState extends State<AsistencialScreen> {
  dynamic user = {}; // Inicializamos user como un objeto vacío
  final storage = FlutterSecureStorage();
  dynamic grupo = {};
   late int idGrupo;
  //get docente => null;
  @override
  void initState() {
    super.initState();
     
    fetUsers();
  }
 

   void didChangeDependencies() {
    super.didChangeDependencies();
    
    final args = ModalRoute.of(context)!.settings.arguments as int;
    
    idGrupo = args;
  }






  Future<Position> determinarPosition() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('No dio permisos a la aplicacion, no puede marcar asistencia');
      }
    }
    return await Geolocator.getCurrentPosition();
  }

  void getCurrenLocation() async {
    try {
      Position position = await determinarPosition();
      print(position.latitude);
      print(position.longitude);
      DateTime now = DateTime.now();
      //print('$now: fecha hora ');   
      //grupo = await docente.getGrupos();  
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Lat: ${position.latitude}, Long: ${position.longitude}')),
      );

    

    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error obteniendo ubicación: $e')),
      );
    }
  }
  

   void marcarAsistencia() async {
    Position position = await determinarPosition();
    DateTime now = DateTime.now();
    String fecha = DateFormat('yyyy-MM-dd').format(now);
    String hora = DateFormat('HH:mm:ss').format(now);
    DocenteService docente = DocenteService();
    // Llama a la función createAsistencia con los parámetros necesarios
     print('$idGrupo  a ver mandao ot');
    var response = await  docente.createAsistencia(hora, 'Presente', fecha, idGrupo, position.latitude , position.longitude);

    if (response.statusCode == 201) {
      
        ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(
           content: Text('Asistencia marcada con éxito'),
           duration: Duration(seconds: 2),
            ),
         );
      // Si la petición fue exitosa, maneja la respuesta aquí
      print('Asistencia marcada con éxito');
    } else {
     ScaffoldMessenger.of(context).showSnackBar(
     SnackBar(
       content: Text('Error al marcar asistencia: ${response.body}'),
       duration: Duration(seconds: 2),
       ),
     );

      print('Error al marcar asistencia: ${response.body}');
    }
  }
  


  void licencia() async {
   
    DateTime now = DateTime.now();
    String fecha = DateFormat('yyyy-MM-dd').format(now);
    String hora = DateFormat('HH:mm:ss').format(now);
    DocenteService docente = DocenteService();
    // Llama a la función createAsistencia con los parámetros necesarios
     print('$idGrupo  a ver mandao ot');
    var response = await  docente.licencia(hora, 'licencia', fecha, idGrupo);

    if (response.statusCode == 201) {
      
        ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(
           content: Text('Asistencia marcada con éxito'),
           duration: Duration(seconds: 2),
            ),
         );
      // Si la petición fue exitosa, maneja la respuesta aquí
      print('licencia marcada con éxito');
    } else {
     ScaffoldMessenger.of(context).showSnackBar(
     SnackBar(
       content: Text('Error al marcar asistencia: ${response.body}'),
       duration: Duration(seconds: 2),
       ),
     );

      print('Error al marcar asistencia: ${response.body}');
    }
  }
   void clasesporzoom() async {
   
    DateTime now = DateTime.now();
    String fecha = DateFormat('yyyy-MM-dd').format(now);
    String hora = DateFormat('HH:mm:ss').format(now);
    DocenteService docente = DocenteService();
    // Llama a la función createAsistencia con los parámetros necesarios
     print('$idGrupo  a ver mandao ot');
    var response = await  docente.licencia(hora, 'clases por zoom', fecha, idGrupo);

    if (response.statusCode == 201) {
      
        ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(
           content: Text('Asistencia virtual exitosa'),
           duration: Duration(seconds: 2),
            ),
         );
      // Si la petición fue exitosa, maneja la respuesta aquí
      print('licencia marcada con éxito');
    } else {
     ScaffoldMessenger.of(context).showSnackBar(
     SnackBar(
       content: Text('Error al marcar asistencia: ${response.body}'),
       duration: Duration(seconds: 2),
       ),
     );

      print('Error al marcar asistencia: ${response.body}');
    }
  }

  void fetUsers() async {
    try {
      // Llamamos a la función getUser con el ID proporcionado
      Usuario usuario = Usuario();
      user = await usuario.getUser();
     
      //grupo = await docente.getGrupos(); 
      // Llamamos a setState para actualizar el widget con los nuevos datos del usuario
      setState(() {});
    } catch (error) {
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
              print('Token eliminado: $deletedToken'); 
              Navigator.pushNamed(context, '/secondPage'); 
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CardWidget(
              title: 'Marcar asistencia',
              content: '',
              onTap: (context) => marcarAsistencia(),
            ),
            SizedBox(height: 16), // Espacio entre las tarjetas
            // Puedes agregar más tarjetas aquí
             CardWidget(title: 'Pedir licencia', content: '', onTap: (context) => licencia()),
            // SizedBox(height: 16),
             CardWidget(title: 'Clases virtuales', content: '', onTap: (context) => clasesporzoom()),
          ],
        ),
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  final String title;
  final String content;
  final Function(BuildContext) onTap;

  const CardWidget({required this.title, required this.content, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(context),
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold,),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                content,
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}



