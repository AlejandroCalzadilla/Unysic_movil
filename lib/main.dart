/*
import 'package:flutter/material.dart';
import 'home.dart';
void main(){
  runApp(const MyApp());
   

}

class MyApp extends StatelessWidget{
  const MyApp({super.key}) ;
  
  
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:HomeScreen() ,
    );
  }
}
*/

// import 'package:apinestjs/auth/login.dart';
// import 'package:apinestjs/botones_reusables/mensaje404.dart';
// import 'package:apinestjs/home.dart';
import 'package:apinestjs/routes/app_routes.dart';
import 'package:flutter/material.dart';
//import 'package:paginas/login.dart';
//import 'home.dart';
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   appBar: AppBar(
    //     title: const Text('Home'),
    //   ),
    //   body: Center(
    //     child: ElevatedButton(
    //       child:const Text('Go to Second Page'),
    //       onPressed: () {
    //         Navigator.pushNamed(context, '/secondPage');
    //       },
    //     ),
        
    //   ),
    // );

     return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/secondPage');
              },
              child: const Text('Go to Second Page'),
            ),
            const SizedBox(height: 16), // Añade espacio entre los botones
            ElevatedButton(
              onPressed: () {
                // Acción cuando se presiona el segundo botón
                Navigator.pushNamed(context, '/tercerPage');
              },
              child: const Text('Otro Botón'),
            ),
            // Añade más botones según sea necesario
            ElevatedButton(
              onPressed: () {
                // Acción cuando se presiona el segundo botón
                Navigator.pushNamed(context, '/fourpage');
              },
              child: const Text('error 404'),
            ),

            ElevatedButton(
              onPressed: () {
                // Acción cuando se presiona el segundo botón
                Navigator.pushNamed(context, '/login');
              },
              child: const Text('login'),
            ), 
             


          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
         
      ),
      
      body: const Center(
        child: Text('This is the second page'),
       
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
     debugShowCheckedModeBanner: false, //para quitar esa marca de agua fea del debugguer
     initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.routes, 
   
  
  ));
}

