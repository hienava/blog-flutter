import 'dart:convert';
import 'package:blog/src/models/blog_model.dart';
import 'package:blog/src/shared_preferences/preferencias_usuario.dart';
import 'package:http/http.dart' as http;

class BlogProvider {
   final String _url = 'https://blog-server-nestjs.herokuapp.com/blogs';

  final _prefs = new PreferenciasUsuario();

  Future<List<BlogModel>> cargarBlogs([String query]) async {

    String _urlBlogs = _url;

    if(query!= null)
    {
      _urlBlogs +=  '?query=$query';
    }

    final resp = await http.get(_urlBlogs, headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${_prefs.token}"
    }, );

    final responseJson = json.decode(resp.body);

    final List<BlogModel> blogs = new List();

    if (responseJson == null) return [];

    responseJson.forEach((data) {
      final blogTemp = BlogModel.fromJson(data);
      blogs.add(blogTemp);
    });

    return blogs;
  }
}
