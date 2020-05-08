import 'package:blog/src/models/blog_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:blog/src/providers/blog_provider.dart';


class DataSearch extends SearchDelegate {
  final BlogProvider blogsProvider = new BlogProvider();

  final blogs = [];

  //Las acciones del appBar, limpiar o cancelar la busq
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          })
    ];
  }

  //Algo que aparece al inicio, icono izquierda
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        });
  }

  //Builder con los resultados de busq
  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  //Sugerencias que aparecen al escribir
  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) return Container();

    return FutureBuilder(
      future: blogsProvider.cargarBlogs(query),
      builder: (BuildContext context, AsyncSnapshot<List<BlogModel>> snapshot) {
        if (snapshot.hasData) {
          final blogs = snapshot.data;
          return ListView(
            children: blogs.map((blog) {
              return ListTile(
                leading: FadeInImage(
                    placeholder: AssetImage('assets/img/no-image.jpg'),
                    width: 40.0,
                    fit: BoxFit.contain,
                    image: CachedNetworkImageProvider(blog.fotoUrl)),
                title: Text(blog.titulo),
                subtitle: Text(blog.country),
                onTap: (){
                  close(context, null);
                  blog.id = '';
                  Navigator.pushNamed(context, 'detalleBlog',arguments: blog);

                },
              );
            }).toList(),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
