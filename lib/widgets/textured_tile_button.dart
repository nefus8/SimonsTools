import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TexturedTileButton extends StatefulWidget {
  final double borderRadius;
  final String imageUrl;
  final List<Color> colors;
  final Alignment begin, end;
  final double left, bottom;
  final String text;
  final TextStyle style;
  final bool boxShadow;
  final Color onPressColor;
  final Function onPressed;

  TexturedTileButton({
    @required this.text,
    @required this.imageUrl,
    @required this.onPressed,
    this.borderRadius = 30,
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
    this.boxShadow = true,
    this.onPressColor = const Color(0x66000000),
  });

  @override
  _TexturedTileButtonState createState() => _TexturedTileButtonState();
}

class _TexturedTileButtonState extends State<TexturedTileButton> with TickerProviderStateMixin {
  bool _isEnabled = false;
  double _y = 0;
  bool _showShadow = true;

  @override
  Widget build(BuildContext context) {
    BorderRadius _radius = BorderRadius.circular(widget.borderRadius);
    Image _image;

    if (widget.imageUrl.startsWith("http")) {
      _image = Image.network(
          widget.imageUrl,
          fit: BoxFit.cover);
    } else {
      _image = Image.asset(
        widget.imageUrl,
        fit: BoxFit.cover,
      );
    }

    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      transform: Matrix4.translationValues(0, _y, 0),
      child: GestureDetector(
        onTapDown: (_) => _onTapDown(),
        onTapUp: (_) => _onTapUp(true),
        onTapCancel: () => _onTapUp(false),
        child: Stack(
          children: <Widget>[
            Container(
              height: 12000,
              decoration: BoxDecoration(
                borderRadius: _radius,
                boxShadow: (widget.boxShadow && _showShadow) ? [BoxShadow(
                  color: widget.colors[0],
                  offset: Offset(0.0, 13.0),
                  blurRadius: 10.0,
                  spreadRadius: -5.0
              )]:null,
              ),
              child: ClipRRect(
                borderRadius: _radius,
                child: _image,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: _radius,
                color: widget.colors.length == 1 ? widget.colors[0] : null,
                gradient: widget.colors.length > 1 ? LinearGradient(
                  colors: widget.colors,
                  begin: widget.begin,
                  end: widget.end,
                ) : null,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: _radius,
                color: _isEnabled ? widget.onPressColor : null,
              ),
            ),
            Positioned(
              left: widget.left,
              bottom: widget.bottom,
              child: Text(
                widget.text,
                style: widget.style,
              ),
            )
          ],
        ),
      ),
    );
  }

  void _onTapUp(bool pressed) {
    setState(() {
      _isEnabled = false;
      _y = 0;
      _showShadow = true;
    });
    if (pressed)
      widget.onPressed();
  }

  void _onTapDown() {
    setState(() {
      _isEnabled = true;
      _y = 7;
      _showShadow = false;
    });
  }
}
