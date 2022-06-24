import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ProjectCover2 extends StatelessWidget {
  ProjectCover2(
      {this.width,
      this.height,
      this.offset,
      this.projectCoverUrl,
      this.projectCoverBackgroundColor,
      this.backgroundScale = 1,
      this.projectCoverScale = 1,
      required this.imageURLs,
      this.alignment = Alignment.topLeft,
      this.origin = const Offset(0, 0)});

  final double? width;
  final double? height;
  final double? offset;
  final double backgroundScale;
  final double projectCoverScale;
  final Offset origin;
  final AlignmentGeometry alignment;
  final String? projectCoverUrl;
  final List<String> imageURLs;
  final Color? projectCoverBackgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Stack(
              children: [
                Positioned(
                  top: offset,
                  left: offset,
                  child: Transform.scale(
                    scale: backgroundScale,
                    origin: origin,
                    alignment: alignment,
                    child: Container(
                        width: width! - offset!,
                        height: height! - offset!,
                        color: projectCoverBackgroundColor),
                  ),
                ),
                Positioned(
                  right: offset,
                  bottom: offset,
                  child: Transform.scale(
                    scale: projectCoverScale,
                    origin: Offset(0, 0),
                    alignment: Alignment.center,
                    child: Container(
                      color: Color.fromARGB(255, 223, 221, 221),
                      width: width! - offset!,
                      height: height! - offset!,
                      padding: EdgeInsets.fromLTRB(0, 200, 0, 0),
                      child: Image.asset(
                        projectCoverUrl!,
                        fit: BoxFit.contain,
                        height: height! - offset!,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              flex: 1,
              child: Container(
                  color: Colors.amber[50],
                  child: ImageSlider(paths: imageURLs)))
        ],
      ),
    );
  }
}

class ImageSlider extends StatelessWidget {
  final List<String> paths;
  final bool isPop;
  const ImageSlider({Key? key, required this.paths, this.isPop = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
          autoPlay: true,
          enlargeCenterPage: true,
          aspectRatio: 16 / 9,
          viewportFraction: 0.8,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn),
      items: paths.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return InkWell(
              child: Hero(tag: i, child: Image.asset(i, fit: BoxFit.scaleDown)),
              onTap: isPop
                  ? null
                  : () {
                      showDialog(
                          context: context,
                          builder: (c) => AlertDialog(
                                content: ImageSlider(paths: paths, isPop: true),
                              ));
                    },
            );
          },
        );
      }).toList(),
    );
  }
}
