import 'package:favorite_place_app/model/fav_places.dart';
import 'package:favorite_place_app/screens/places_datails.dart';
import 'package:flutter/material.dart';

class PlacesList extends StatelessWidget {
  const PlacesList({super.key, required this.placeses});

  final List<Places> placeses;
  @override
  Widget build(BuildContext context) {
    Widget list = const Center(
      child: Text(
        'plz add new placess',
      ),
    );

    if (placeses.isNotEmpty) {
      list = ListView.builder(
        itemCount: placeses.length,
        itemBuilder: (context, index) => ListTile(
          leading: CircleAvatar(
            radius: 26,
            backgroundImage: FileImage(placeses[index].image),
          ),
          title: Text(
            placeses[index].title,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (ctx) => PlacesDatails(places: placeses[index]),
            ));
          },
        ),
      );
    }
    return list;
  }
}
