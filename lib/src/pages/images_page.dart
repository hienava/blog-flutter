import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String image = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black),
      body: Container(
        decoration: new BoxDecoration(color: Colors.black),
        child: Center(
          child: Container(
            width: double.infinity,
            child: FadeInImage(
                fit: BoxFit.cover,
                image: CachedNetworkImageProvider(image),
                placeholder: AssetImage('assets/img/loading.gif')),
          ),
        ),
      ),
    );
  }
}
