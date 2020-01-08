import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageWithDescription {
  String imageUrl;
  String imageTitle;
  String imageInfo;
  String title;
  String description;

  Color imageTextColor, titleColor, descriptionColor, backgroundColor;

  ImageWithDescription({
    @required this.imageUrl,
    @required this.title,
    @required this.description,
    this.imageTitle = '',
    this.imageInfo = '',
    this.imageTextColor = Colors.white,
    this.titleColor = Colors.black,
    this.descriptionColor = Colors.grey,
    this.backgroundColor = Colors.white,
  });
}