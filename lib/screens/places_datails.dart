import 'package:favorite_place_app/model/fav_places.dart';
import 'package:flutter/material.dart';

class PlacesDatails extends StatelessWidget {
  const PlacesDatails({super.key, required this.places});
  final Places places;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(places.title),
      ),
      body: Stack(children: [
        Image.file(
          places.image,
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
        )
      ]),
    );
  }
}
