import 'package:flutter/material.dart';
import 'package:meus_eventos/models/usuario.dart';

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
}
