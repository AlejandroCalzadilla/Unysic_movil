//import 'package:epharm_app/screens/screens.dart';
import 'package:apinestjs/screens/asistencia_screen.dart';
import 'package:apinestjs/screens/auth/login.dart';
import 'package:apinestjs/botones_reusables/mensaje404.dart';
import 'package:apinestjs/screens/home.dart';
import 'package:apinestjs/screens/horarios_screen.dart';
import 'package:apinestjs/usuario_index.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const initialRoute = 'root';

  static final Map<String, Widget Function(BuildContext)> routes = {
       '/':         ( context ) =>   LoginScreen(),
      '/secondPage': (context) => const HomeScreen(),
      '/tercerPage': (context) =>const  UserDetailScreen(),
      '/asistencia': (context) =>const  AsistencialScreen(),

      '/fourpage': (context) =>const   Error404Widget(),
      '/login': (context) =>  LoginScreen(),
   
   
   /*  'login'         : ( _ ) => const LoginScreen(),
    'register'      : ( _ ) => const RegisterScreen(),
    'home'          : ( _ ) => const HomeScreen(),
    'products'      : ( _ ) => const ProductsScreen(),
    'product_detail': ( _ ) => const ProductDetailScreen(),
    'cart'          : ( _ ) => const CartScreen(),
    'profile'       : ( _ ) => const ProfileScreen(),
    'root'          : ( _ ) => const RootScreen(), */
    //'failed_connection': ( _ ) => const FailedConnectionScreen(),
  };


}