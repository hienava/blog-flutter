import 'package:blog/src/bloc/blogs_bloc.dart';
import 'package:blog/src/bloc/provider.dart';
import 'package:blog/src/models/blog_model.dart';
import 'package:blog/src/providers/blog_provider.dart';
import 'package:blog/src/search/search_delegate.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:blog/src/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {
  final BlogProvider blogsProvider = new BlogProvider();

  @override
  Widget build(BuildContext context) {
    final blogsBloc = Provider.blogsBloc(context);
    blogsBloc.cargarBlogs();

    return Scaffold(
        appBar: AppBar(
          title: Text('Viajes Javi y Nati'),
            actions: <Widget>[
          IconButton(icon: Icon(Icons.search), 
          onPressed: (){
            showSearch(context: context,
             delegate: DataSearch());
          })
        ],
        ),
        
        backgroundColor: Color(0xFFdde0e3),
        drawer: MenuWidget(),
        body: _crearListado(blogsBloc));
  }

  

  Widget _crearListado(BlogsBloc blogsBloc) {
    return StreamBuilder(
      stream: blogsBloc.blogsStream,
      builder: (BuildContext context, AsyncSnapshot<List<BlogModel>> snapshot) {
        if (snapshot.hasData) {
          final blogs = snapshot.data;

          return ListView.builder(
            itemCount: blogs.length,
            itemBuilder: (context, i) =>
                _crearItem(context, blogsBloc, blogs[i]),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _crearItem(BuildContext context, BlogsBloc blogsBloc, BlogModel blog) {
    return  Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: GestureDetector(
            onTap: () =>
                Navigator.pushNamed(context, 'detalleBlog', arguments: blog),
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  (blog.fotoUrl == null)
                      ? Image(image: AssetImage('assets/img/no-image.png'))
                      : FadeInImage(
                          image: CachedNetworkImageProvider(blog.fotoUrl),
                          placeholder: AssetImage('assets/img/jar-loading.gif'),
                          height: 300.0,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                  ListTile(
                    title: Text('${blog.titulo} - ${blog.city}'),
                    subtitle: Text(blog.country),
                  ),
                ],
              ),
            ),
          ),
        );
  }
}
