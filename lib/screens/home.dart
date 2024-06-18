

import 'package:apinestjs/conexion/conexionUsers.dart';
import 'package:apinestjs/service/docente_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
//import 'package:apinestjs/service/docente_service.dart';





class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> grupos = [];
  final storage = FlutterSecureStorage();

  @override
  void initState() {
    super.initState();
    fetUsers(); // Llama a fetUsers al inicializar el widget
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grupos del Docente'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              fetUsers();
            },
          ),
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () async {
              await storage.delete(key: 'jwt');
              final deletedToken = await storage.read(key: 'jwt');
              print('Token eliminado: $deletedToken');
              Navigator.pushNamed(context, '/');
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: grupos.length,
        itemBuilder: (context, index) {
          final usuario = grupos[index];
          final materia = usuario['materiaNombre'];
          final dia = usuario['dia'];
          final horainicio = usuario['horaInicio']; // Asegúrate de que este campo exista en tu JSON
          final horafin = usuario['horaFin'];
          final numeromodulo = usuario['numeroModulo'];
          final aula = usuario['numeroAula'];
          final grupo = usuario['grupoNombre'];
          final idgrupo = usuario['idGrupo'];

          return GestureDetector(
            onTap: () async {
              // Acción al hacer tap en la tarjeta
               await storage.write(key: 'idg', value: idgrupo);
              Navigator.pushNamed(
                context,'/asistencia',  arguments: int.parse(idgrupo),);
              print('Tapped on $materia');
            },
            child: Card(
              margin: const EdgeInsets.all(8.0),
              elevation: 5.0,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        radius: 30.0,
                        child: Text('${index + 1}'),
                      ),
                      visualDensity: const VisualDensity(horizontal: 0.0, vertical: 4.0),
                      title: Text(
                        materia,
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(dia),
                          Row(
                            children: [
                              Text('de: '), Text(horainicio),
                              Text(' a '),
                              Text(horafin),
                            ],
                          ),
                          Row(
                            children: [
                              Text('módulo: '),
                              Text(numeromodulo),
                            ],
                          ),
                          Row(
                            children: [
                              Text('aula: '),
                              Text(aula),
                            ],
                          ),
                          Row(
                            children: [
                              Text('grupo: '),
                              Text(grupo),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void fetUsers() async {
    try {
      DocenteService docente = DocenteService();
      grupos = await docente.getGrupos();
      setState(() {});
    } catch (error) {
      // Manejo de error
    }
  }
}



















/* class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   List<dynamic>grupos =[];
  final storage = FlutterSecureStorage();
   @override
  void initState() {
    super.initState();
    fetUsers(); // Llama a fetUsers al inicializar el widget
  }  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('grupos del docente'),
        actions: [
          
      IconButton(
        icon: const Icon(Icons.refresh),
        onPressed: () {
          fetUsers();
        },
      ),
       IconButton(
        icon: const Icon(Icons.exit_to_app),
        onPressed: () async {
        await storage.delete(key: 'jwt');
          final deletedToken = await storage.read(key: 'jwt');
         print('Token eliminado: $deletedToken'); //  
          // ignore: use_build_context_synchronously
          Navigator.pushNamed(context, '/'); 
      
        },
      ), 
    ],

      ),
body: ListView.builder(
  itemCount: grupos.length,
  itemBuilder: (context, index) {
    final usuario = grupos[index];
    final materia = usuario['materiaNombre'];
    final dia = usuario['dia'];
    final horainicio = usuario['horaInicio']; // Asegúrate de que este campo exista en tu JSON
    final horafin = usuario['horaFin'];
    final numeromodulo = usuario['numeroModulo'];
    final aula = usuario['numeroAula'];
    final grupo = usuario['grupoNombre'];
    final idgrupo = usuario['idGrupo'];

    return GestureDetector(
      onTap: () {
        // Acción al hacer tap en la tarjeta
        Navigator.pushNamed(
      context,
      '/asistencia',
      arguments: int.parse(idgrupo), // Pasas el idgrupo como argumento
    );
        print('Tapped on $materia');
        // Aquí puedes realizar otras acciones como navegar a otra pantalla
      },
      child: Card(
        margin: const EdgeInsets.all(8.0),
        elevation: 5.0,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: CircleAvatar(
                  radius: 30.0,
                  child: Text('${index + 1}'),
                ),
                visualDensity: const VisualDensity(horizontal: 0.0, vertical: 4.0),
                title: Text(
                  materia,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(dia),
                    Row(
                      children: [
                        Text('de: '),Text(horainicio),
                        Text(' a '),
                        Text(horafin),
                      ],
                    ),
                    Row(
                      children: [
                        Text('modulo : '),
                        Text(numeromodulo),
                      ],
                    ),
                    Row(
                      children: [
                        Text('aula : '),
                        Text(aula),
                      ],
                    ),
                    Row(
                      children: [
                        Text('grupo : '),
                        Text(grupo),
                      ],
                    ),
                    // Agrega más texto aquí si es necesario
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  },
),
    );
    
  }
  void fetUsers() async {
   
    try {
      // Llamamos a la función getUser con el ID proporcionado
      DocenteService docente = DocenteService();
      grupos = await docente.getGrupos();     
      // Llamamos a setState para actualizar el widget con los nuevos datos del usuario
      setState(() {});
    } catch (error) {
     // Error404Widget error= Error404Widget(); 
      
      //print('Error al obtener el usuario : $error');
    }
  }
} */



