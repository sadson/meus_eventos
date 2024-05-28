import 'package:flutter/material.dart';
import 'package:meus_eventos/main.dart';
// import 'package:meus_eventos/models/usuario.dart';
// import 'package:meus_eventos/providers/usuario_provider.dart';
// import 'package:provider/provider.dart';

class AuthCheck extends StatefulWidget {
  const AuthCheck({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AuthCheckState createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> {
  @override
  void initState() {
    super.initState();
    _redirect();
  }
  Future<void> _redirect() async {
    await Future.delayed(Duration.zero);
    if (!mounted) {
      return;
    }

    final logado = supabase.auth.currentUser?.aud;
    if (logado == null) {
      Navigator.of(context).pushReplacementNamed('/login');
    } else {
      Navigator.of(context).pushReplacementNamed('/home');
    }
  }


  @override
  Widget build(BuildContext context) {
    // final auth = Provider.of<UsuarioProvider>(context);
    // final usuario = Usuario.empty();
    // // Verifique a autenticação e navegue para a tela apropriada

    // if (auth.usuario.logado) {
    //   Navigator.of(context).pushReplacementNamed('/home');
    // } else {
    //   auth.loggin(usuario).then((_) {
    //     if (auth.usuario.logado) {
    //       Navigator.of(context).pushReplacementNamed('/home');
    //     } else {
    //       Navigator.of(context).pushReplacementNamed('/login');
    //     }
    //   });
    // }

    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
