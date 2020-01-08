import 'package:flutter/material.dart';
import 'package:simons_tools/models/ImageWithDescription.dart';

class ImageWithDescriptionCarousel extends StatelessWidget {
  List<ImageWithDescription> imageWithDescriptionList;
  Function routingFunction;
  bool isImageAnAsset;

  ImageWithDescriptionCarousel({this.imageWithDescriptionList, this.routingFunction, this.isImageAnAsset = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: imageWithDescriptionList.length,
        itemBuilder: (BuildContext context, int index) {
          ImageWithDescription iwd = imageWithDescriptionList[index];
          return GestureDetector(
            onTap:() => routingFunction != null ? routingFunction() : print("null"),
            child: Container(
              margin: EdgeInsets.all(10.0),
              width: 210.0,
              child: Stack(
                alignment: Alignment.topCenter,
                children: <Widget>[
                  Positioned(
                    bottom: 10.0,
                    child: Container(
                      height: 120.0,
                      width: 200.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text(iwd.title,
                                style: TextStyle(
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1.2,
                                )),
                            Text(
                              iwd.description,
                              style: TextStyle(color: Colors.grey),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.white,
                      boxShadow: [BoxShadow(color: Colors.black26, offset: Offset(0.0, 2.0), blurRadius: 6.0)],
                    ),
                    child: Stack(
                      children: <Widget>[
                        Hero(
                          tag: iwd.imageUrl,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image(
                              height: 180.0,
                              width: 180.0,
                              image: isImageAnAsset ? AssetImage(
                                iwd.imageUrl,
                              ) : NetworkImage(iwd.imageUrl),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 10.0,
                          bottom: 10.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                iwd.imageTitle,
                                style: TextStyle(color: Colors.white, fontSize: 24.0, fontWeight: FontWeight.w600),
                              ),
                              Text(
                                iwd.imageInfo,
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
