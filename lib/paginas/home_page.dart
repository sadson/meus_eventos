import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:meus_eventos/componentes/app_bar_meus_eventos.dart';
import 'package:meus_eventos/componentes/menu.dart';
import 'package:meus_eventos/main.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    //Verifica se está logado
    supabase.auth.onAuthStateChange.listen((event) async {
      if (event.event == AuthChangeEvent.signedIn) {
        //Solicita permissão para notificações
        await FirebaseMessaging.instance.requestPermission();
        //Se for IOS carrega os tokens de acesso
        await FirebaseMessaging.instance.getAPNSToken();
        //Captura o token do firebase gerado na conexão
        final fcmToken = await FirebaseMessaging.instance.getToken();
        if (fcmToken != null) {
          //Salva o token no supabase
          await _setFcmToken(fcmToken);
        }
      }
    });
    FirebaseMessaging.instance.onTokenRefresh.listen((event) async {
      //Se houver atualição do token será atualizado no supabase
      await _setFcmToken(event);
    });
    //Notificação com o aplicativo aberto
    FirebaseMessaging.onMessage.listen((payload) {
      final notification = payload.notification;
      if (notification != null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('${notification.title} ${notification.body}')));
      }
    });
  }

  //Metodo que conecta no supabase e salva os dados
  //na tabela profile
  Future<void> _setFcmToken(String fcmToken) async {
    final userId = supabase.auth.currentUser!.id;
    if (userId.isEmpty) {
      await supabase
          .from('profile')
          .upsert({'id': userId, 'fcm_token': fcmToken});
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarMeusEventos(),
      body: Menu(),
    );
  }
}
