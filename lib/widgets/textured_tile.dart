import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TexturedTile extends StatelessWidget {
  final double width, height;
  final double borderRadius;
  final String imageUrl;
  final List<Color> colors;
  final Alignment begin, end;
  final double left, bottom;
  final String text;
  final TextStyle style;

  TexturedTile({
    @required this.text,
    this.width = 200,
    this.height = 200,
    this.borderRadius = 30,
    this.imageUrl = 'lib/assets/images/wood1.jpg',
    this.colors = const [Color(0xCBfebea9), Color(0xBBff9d98)],
    this.begin = Alignment.topRight,
    this.end = Alignment.bottomLeft,
    this.left = 20.0,
    this.bottom = 20.0,
    this.style = const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 18,
    ),
  });

  @override
  Widget build(BuildContext context) {
    BorderRadius _radius = BorderRadius.circular(borderRadius);
    Image _image;

    if (imageUrl.startsWith("http")) {
      _image = Image.network(imageUrl, fit: BoxFit.cover);
    } else {
      _image = Image.asset(
        imageUrl,
        fit: BoxFit.cover,
      );
    }

    return Stack(
      children: <Widget>[
        Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: _radius,
          ),
          child: ClipRRect(
            borderRadius: _radius,
            child: _image,
          ),
        ),
        Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: _radius,
            color: colors.length == 1 ? colors[0] : null,
            gradient: colors.length > 1 ? LinearGradient(
              colors: colors,
              begin: begin,
              end: end,
            ) : null,
          ),
        ),
        Positioned(
          left: left,
          bottom: bottom,
          child: Text(
            text,
            style: style,
          ),
        )
      ],
    );
  }
}
