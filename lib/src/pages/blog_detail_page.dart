import 'package:blog/src/models/blog_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BlogDetailPage extends StatelessWidget {
  final estiloTitulo = TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold);
  final estiloSubtitulo = TextStyle(fontSize: 18.0, color: Colors.grey);

  final BlogModel blog = new BlogModel();

  @override
  Widget build(BuildContext context) {
    final BlogModel blogData = ModalRoute.of(context).settings.arguments;

    return Scaffold(
        body: CustomScrollView(
      slivers: <Widget>[
        _cabeceraImagen(blogData),
        SliverList(
          delegate: SliverChildListDelegate([
            SizedBox(
              height: 10.0,
            ),
            _tituloDetalle(blogData),
            _detalleBlog(blogData),
            _fotosBlog(blogData)
          ]),
        )
      ],
    ));
  }

  ///Esto es un comentario
  Widget _cabeceraImagen(BlogModel blog) {
    return SliverAppBar(
        elevation: 2.0,
        backgroundColor: Colors.white,
        expandedHeight: 300.0,
        floating: false,
        pinned: true,
        flexibleSpace: FlexibleSpaceBar(
          background: FadeInImage(
            placeholder: AssetImage('assets/img/loading.gif'),
            fit: BoxFit.cover,
            image: CachedNetworkImageProvider(blog.fotoUrl),
          ),
        ));
  }

  Widget _tituloDetalle(BlogModel blog) {
    return SafeArea(
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 0.0),
          child: Row(children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(blog.titulo, style: estiloTitulo),
                  SizedBox(height: 5.0),
                  Text(blog.country + ' ' + blog.city, style: estiloSubtitulo),
                ],
              ),
            ),
          ])),
    );
  }

  Widget _detalleBlog(BlogModel blog) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
        child: Text(
          blog.body,
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }

  Widget _fotosBlog(BlogModel blog) {
    if(blog.pictures != null) {
    return _crearImagenesPageView(blog.pictures);
    }
    else {return Container();}
  }

  Widget _crearImagenesPageView(List imagenes) {
    return SizedBox(
      height: 100.0,
      child: PageView.builder(
        pageSnapping: false,
        controller: PageController(initialPage: 1, viewportFraction: 0.3),
        itemCount: imagenes.length,
        itemBuilder: (BuildContext context, int index) {
          return _imagenTarjeta(imagenes[index], context);
        },
      ),
    );
  }

  Widget _imagenTarjeta(imagen, BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: GestureDetector(
              onTap: () {
                 Navigator.pushNamed(context, 'imagen', arguments: imagen);
              },
              child: FadeInImage(
                height: 80,
                fit: BoxFit.cover,
                placeholder: AssetImage('assets/img/loading.gif'),
                image: CachedNetworkImageProvider(imagen),
              ),
            ),
          )
        ],
      ),
    );
  }
}
