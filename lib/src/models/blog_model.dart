import 'dart:convert';

BlogModel blogModelFromJson(String str) => BlogModel.fromJson(json.decode(str));

String blogModelToJson(BlogModel data) => json.encode(data.toJson());

class BlogModel {
  String id;
  String titulo;
  String body;
  String country;
  String city;
  String createdBy;
  String fotoUrl;
  List<dynamic> pictures;

  BlogModel({
    this.id,
    this.titulo,
    this.body,
    this.country,
    this.city,
    this.createdBy,
    this.fotoUrl,
    this.pictures
  });

  factory BlogModel.fromJson(Map<String, dynamic> json) => new BlogModel(
        id: json["_id"],
        titulo: json["title"],
        body: json["body"],
        country: json["country"],
        city: json["city"],
        createdBy: json["createdBy"],
        fotoUrl: json["urlPicture"],
        pictures: json["pictures"]
      );

  Map<String, dynamic> toJson() => {
         "_id"         : id,
        "titulo": titulo,
        "body": body,
        "country": country,
        "urlPicture": fotoUrl,
        "createdBy": createdBy,
        "city": city,
        "pictures": pictures
      };
}
