import 'package:flutter/material.dart';

class Error404Widget extends StatelessWidget {
  const Error404Widget({super.key});

  final  TextStyle errorTextStyle = const  TextStyle(fontSize: 18, fontWeight: FontWeight.bold, decoration: TextDecoration.none, 
  );
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        
        children: [
          const Icon(Icons.error, size: 50, color: Colors.blue),
          const SizedBox(height: 16),
          Text(
            'Error 404: Recurso no encontrado',
            style: errorTextStyle
          ),
          const SizedBox(height: 8),
          Text(
            'La página o recurso que estás buscando no existe.',
             style: errorTextStyle

            ),
        ],

      ),
    );
  }
}
