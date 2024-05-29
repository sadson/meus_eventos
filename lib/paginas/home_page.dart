import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:meus_eventos/componentes/menu.dart';
import 'package:meus_eventos/main.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> _signOut() async {
    try {
      await supabase.auth.signOut();
    } on AuthException catch (error) {
      if (mounted) {
        SnackBar(
          content: Text(error.message),
          backgroundColor: Theme.of(context).colorScheme.error,
        );
      }
    } catch (error) {
      if (mounted) {
        SnackBar(
          content: const Text('Unexpected error occurred'),
          backgroundColor: Theme.of(context).colorScheme.error,
        );
      }
    } finally {
      if (mounted) {
        Navigator.of(context).pushReplacementNamed('/login');
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    supabase.auth.onAuthStateChange.listen((event) async {
      if (event.event == AuthChangeEvent.signedIn) {
        await FirebaseMessaging.instance.requestPermission();
        await FirebaseMessaging.instance.getAPNSToken();
        final fcmToken = await FirebaseMessaging.instance.getToken();
        if (fcmToken != null) {
          await _setFcmToken(fcmToken);
        }
      }
    });
    FirebaseMessaging.instance.onTokenRefresh.listen((event) async {
      await _setFcmToken(event);
    });
  }

  Future<void> _setFcmToken(String fcmToken) async {
    final userId = supabase.auth.currentUser!.id;
    if (userId != null) {
      await supabase
          .from('profile')
          .upsert({'id': userId, 'fcm_token': fcmToken});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus eventos'),
        actions: [IconButton(onPressed: () async {
          _signOut();
        }, icon: const Icon(Icons.logout))],
      ),
      body: Column(
        children: [
          const Text('Esta é a home page'),
          TextButton(
              onPressed: () {
                _signOut();
              },
              child: const Text('Sair'))
        ],
      ),
      drawer: const Menu(),
    );
  }
}
