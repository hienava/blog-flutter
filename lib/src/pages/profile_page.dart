import 'package:flutter/material.dart';
import 'package:blog/src/widgets/menu_widget.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Profile Page'),
        ),
        drawer: MenuWidget(),
        body: Center(
          child: Column(
            children: <Widget>[Text('Profile Page')],
          ),
        ));
  }



}