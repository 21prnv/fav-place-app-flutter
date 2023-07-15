import 'package:favorite_place_app/model/fav_places.dart';
import 'package:favorite_place_app/provider/new_place_provider.dart';
import 'package:favorite_place_app/screens/new_place.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import "package:favorite_place_app/widget/places_list.dart";

class FavPlacesList extends ConsumerStatefulWidget {
  const FavPlacesList({super.key});

  @override
  ConsumerState<FavPlacesList> createState() {
    return _FavPlacesListState();
  }
}

class _FavPlacesListState extends ConsumerState<FavPlacesList> {
  late Future<void> _placesFuture;

  @override
  void initState() {
    super.initState();
    _placesFuture = ref.read(AddPlacesProvider.notifier).loadPlaces();
  }

  @override
  Widget build(BuildContext context) {
    final userPlaces = ref.watch(AddPlacesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Places'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => const NewPlace(),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
          future: _placesFuture,
          builder: (context, snapshot) =>
              snapshot.connectionState == ConnectionState.waiting
                  ? const Center(child: CircularProgressIndicator())
                  : PlacesList(
                      placeses: userPlaces,
                    ),
        ),
      ),
    );
  }
}
