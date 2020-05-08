import 'package:blog/src/bloc/blogs_bloc.dart';
import 'package:blog/src/bloc/login_bloc.dart';
import 'package:flutter/foundation.dart';
export 'package:blog/src/bloc/login_bloc.dart';
import 'package:flutter/material.dart';


class Provider extends InheritedWidget {

  static Provider _instancia;

  factory Provider({Key key, Widget child}) {

    if(_instancia ==null) {

      _instancia = new Provider._internal(key:key, child:child);
    }

    return _instancia;
  }

  final loginBloc = LoginBloc();
  final _blogsBloc = new BlogsBloc();


  Provider._internal({Key key, Widget child })
  : super(key:key, child:child);


  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static LoginBloc of ( BuildContext context ){
   return context.dependOnInheritedWidgetOfExactType<Provider>().loginBloc;
}

  static BlogsBloc blogsBloc ( BuildContext context ) {
    return context.dependOnInheritedWidgetOfExactType<Provider>()._blogsBloc;
  }





}