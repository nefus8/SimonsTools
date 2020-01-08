import 'package:flutter/cupertino.dart';

class ImageWithDescription {
  String imageUrl;
  String imageTitle;
  String imageInfo;
  String title;
  String description;

  ImageWithDescription({
    @required this.imageUrl,
    this.imageTitle = '',
    this.imageInfo = '',
    @required this.title,
    @required this.description,
  });
}