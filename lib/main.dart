import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meus_eventos/componentes/app_widget.dart';
import 'package:meus_eventos/providers/usuario_provider.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  WidgetsFlutterBinding.ensureInitialized();
  //Conexão com o firebase
  await Firebase.initializeApp(
    name: 'notify',
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //Conexão com o supabase
  await Supabase.initialize(
    url: "https://eljisqhjinshglwjpoue.supabase.co",
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImVsamlzcWhqaW5zaGdsd2pwb3VlIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTY4MjA3NTUsImV4cCI6MjAzMjM5Njc1NX0.tWwGx_s6VyvoXuDp8Fnx1JXwmhfFKuNcVq5gxupl_wA',
  );
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => UsuarioProvider()),
  ], child: AppWidget()));
}

final supabase = Supabase.instance.client;
