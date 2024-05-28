import 'package:flutter/material.dart';
import 'package:meus_eventos/componentes/menu.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Informações'),
        ),
        drawer: Menu(),
        body: Container(
          child: Text('Informações'),
        ));
  }
}
