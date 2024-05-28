// ignore_for_file: public_member_api_docs, sort_constructors_first
class Usuario {
  late String login;
  late String senha;
  late bool logado;

  Usuario({
    required this.login,
    required this.senha,
    required this.logado,
  });
  
  Usuario.empty({this.login = '', this.senha = '', this.logado = false});
}
