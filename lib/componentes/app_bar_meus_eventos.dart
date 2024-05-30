import 'package:flutter/material.dart';
import 'package:meus_eventos/providers/usuario_provider.dart';
import 'package:provider/provider.dart';

class AppBarMeusEventos extends StatelessWidget implements PreferredSizeWidget {
  const AppBarMeusEventos({super.key, 
    this.height = kToolbarHeight,
  });
  @override
  Size get preferredSize => Size.fromHeight(height);
  final double height;

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<UsuarioProvider>(context, listen: false);

    return AppBar(
      title: const Text('Meus eventos'),
      actions: [
        IconButton(
          onPressed: () async {
            auth.signOut(context);
          },
          icon: const Icon(
            Icons.logout,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
