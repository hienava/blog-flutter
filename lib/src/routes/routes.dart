import 'package:flutter/material.dart';
import 'package:blog/src/pages/login_page.dart';
import 'package:blog/src/pages/profile_page.dart';
import 'package:blog/src/pages/home_page.dart';
import 'package:blog/src/pages/images_page.dart';
import 'package:blog/src/pages/blog_detail_page.dart';


Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    'login': (BuildContext context) => LoginPage(),
    'detalleBlog': (BuildContext context) => BlogDetailPage(),
    'imagen': (BuildContext context) => ImagePage(),
    'profile': (BuildContext context) => ProfilePage(),
    'home': (BuildContext context) => HomePage(),
  };
}
