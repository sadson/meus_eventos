import 'package:flutter/material.dart';
import 'package:meus_eventos/componentes/auth_check.dart';
import 'package:meus_eventos/paginas/cadastro_page.dart';
import 'package:meus_eventos/paginas/calendario_page.dart';
import 'package:meus_eventos/paginas/home_page.dart';
import 'package:meus_eventos/paginas/info_page.dart';
import 'package:meus_eventos/paginas/login_page.dart';



class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meus eventos',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.brown,
          foregroundColor: Colors.white,
          
        ),
        drawerTheme: const DrawerThemeData(
            backgroundColor: Colors.brown,   
          
        )
      ),
      
      initialRoute: '/',
      routes: {
        '/': (context)=> const AuthCheck(),
        '/login': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
        '/info':(context)=> const InfoPage(),
        '/calendario': (context) => const CalendarioPage(),
        '/cadastro': (context) => const CadastroPage(),
      },
    );
  }
}
