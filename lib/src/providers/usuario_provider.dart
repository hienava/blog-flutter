import 'dart:convert';
import 'package:blog/src/shared_preferences/preferencias_usuario.dart';
import 'package:http/http.dart' as http;

class UsuarioProvider {

  final _prefs = new PreferenciasUsuario();
  final _urlLogin = 'https://blog-server-nestjs.herokuapp.com/user/login';
  bool loading = false;

  bool get isLoading {
    return loading;
  }

   set isLoading(bool value) {
    loading = value ;
  }

  Future<Map<String, dynamic>> login( String email, String password) async {

    final authData = {
      'username'    : email,
      'password' : password,
      'returnSecureToken' : true
    };
    
    loading = true;

    final resp = await http.post(_urlLogin, headers: {"Content-Type": "application/json"},
      body: json.encode( authData )
    );
    loading = false;
    Map<String, dynamic> decodedResp = json.decode( resp.body );

    if ( decodedResp.containsKey('token') ) {
      
      _prefs.token = decodedResp['token'];
      _prefs.nombreUsuario = email;
      _prefs.passUsuario = password;

      return { 'ok': true, 'token': decodedResp['token'] };
    } else {
      return { 'ok': false, 'mensaje': decodedResp['message'] };
    }

  }





}