import 'package:blog/src/shared_preferences/preferencias_usuario.dart';
import 'package:flutter/material.dart';


class MenuWidget extends StatelessWidget {
   final _prefs = new PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Container(),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/img/original.jpg'),
                    fit: BoxFit.cover)),
          ),
          ListTile(
            leading: Icon(Icons.pages, color: Colors.blue),
            title: Text('Blogs'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, 'home');
            },
          ),
          SizedBox(height: 10.0),
          ListTile(
            leading: Icon(Icons.power_settings_new, color: Colors.blue,),
            title: Text('Logout'),
            onTap: () {
              _prefs?.clear();
             Navigator.pushReplacementNamed(context,'login');

            },
          ),
        ],
      ),
    );
  }
}