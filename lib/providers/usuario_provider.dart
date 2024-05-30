import 'package:flutter/material.dart';
import 'package:meus_eventos/main.dart';
import 'package:meus_eventos/models/usuario.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UsuarioProvider extends ChangeNotifier {
  Usuario usuario = Usuario(login: '', senha: '', logado: false);

  Future<void> loggin(Usuario usuario) async {
    await Future.delayed(const Duration(seconds: 2));
    this.usuario = usuario;
    notifyListeners();
  }

  logout() {
    usuario = Usuario.empty();
    notifyListeners();
  }

  Future<void> signOut(BuildContext context) async {
    try {
      await supabase.auth.signOut();
    } on AuthException catch (error) {
      SnackBar(
        content: Text(error.message),
        // ignore: use_build_context_synchronously
        backgroundColor: Theme.of(context).colorScheme.error,
      );
    } catch (error) {
      SnackBar(
        content: const Text('Unexpected error occurred'),
        // ignore: use_build_context_synchronously
        backgroundColor: Theme.of(context).colorScheme.error,
      );
    } finally {
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacementNamed('/login');
    }
  }
}
