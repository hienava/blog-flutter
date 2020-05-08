import 'package:blog/src/bloc/provider.dart';
import 'package:blog/src/shared_preferences/preferencias_usuario.dart';
import 'package:flutter/material.dart';
import 'package:blog/src/routes/routes.dart';

///Initialize Shared Preferences
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();

  runApp(MyApp());
}

///Provider Widget parent for using Bloc pattern
class MyApp extends StatelessWidget {
  final prefs = new PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {

    return Provider(
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Blog',
            initialRoute: prefs.ultimaPagina,
            theme: ThemeData(
              primaryColor: Colors.blue
            ),
            routes: getApplicationRoutes())
            );
  }
}
