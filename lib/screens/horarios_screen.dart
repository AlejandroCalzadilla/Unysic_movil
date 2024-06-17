//import 'package:apinestjs/botones_reusables/mensaje404.dart';
import 'package:apinestjs/conexion/conexionUsers.dart';
import 'package:apinestjs/service/docente_service.dart';
import 'package:flutter/material.dart';



class HorarioDetailScreen extends StatefulWidget {
  const HorarioDetailScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HorarioDetailScreenState createState() => _HorarioDetailScreenState();
}

class _HorarioDetailScreenState extends State<HorarioDetailScreen> {
  dynamic grupo = {}; // Inicializamos user como un objeto vacío

  @override
  void initState() {
    super.initState();
    fetUsers();
  }

  void fetUsers() async {
    try {
      // Llamamos a la función getUser con el ID proporcionado
      DocenteService docente = DocenteService();
      grupo = await docente.getGrupos();     
      // Llamamos a setState para actualizar el widget con los nuevos datos del usuario
     print('$grupo aver que llega de la peticio');
      setState(() {});
    } catch (error) {
     // Error404Widget error= Error404Widget(); 
      
      //print('Error al obtener el usuario : $error');
    }
  }

 

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles del Usuario'),
      ),
      body: Padding(
        padding:  EdgeInsets.all(16.0),
        child: Card(
          elevation: 5, // Ajusta la elevación según sea necesario
           shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0), // Asegura que el borde del card se alinee con el borde del container
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                 
                  'Nombre: ${grupo['dia']}',
                  style: const  TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
               const  SizedBox(height: 8),
              const Text (
               
                'Fecha de Creación: 01/01/2021',
                //'Fecha de Creación: ${user['createdAt']}',
                style: TextStyle(fontSize: 16),
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


  



