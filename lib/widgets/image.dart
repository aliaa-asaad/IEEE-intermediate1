import 'package:flutter/material.dart';
class Photo extends StatelessWidget {
  final String? image;
  Photo({this.image});
  @override
  Widget build(BuildContext context) {
    return Image.network(
      image!,
      fit: BoxFit.fill,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
    );
  }
}