import 'package:flutter/material.dart';
import 'package:meus_eventos/componentes/item_menu.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    List<ItemMenu> submenus = [
      ItemMenu(
          title: 'Inicio',
          iconData: Icons.home,
          background: Colors.blue,
          route: '/home'),
      ItemMenu(
          title: 'Eventos',
          iconData: Icons.event,
          background: Colors.blue,
          route: '/calendario'),
      ItemMenu(
          title: 'Cotas',
          iconData: Icons.monetization_on,
          background: Colors.blue,
          route: '/home'),
      ItemMenu(
          title: 'Anuncios gerais',
          iconData: Icons.announcement,
          background: Colors.blue,
          route: '/home'),
      ItemMenu(
          title: 'Informações',
          iconData: Icons.info,
          background: Colors.blue,
          route: '/info'),
    ];
    return GridView.count(
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
      padding: EdgeInsets.all(16),
      crossAxisCount: 2,
      children: List.generate(submenus.length, (index) {
        return submenus[index];
      }),
    );
  }
}
