import 'package:favorite_place_app/model/fav_places.dart';
import 'package:favorite_place_app/provider/new_place_provider.dart';
import 'package:favorite_place_app/widget/image_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:io';
import 'package:favorite_place_app/widget/location_input.dart';

class NewPlace extends ConsumerStatefulWidget {
  const NewPlace({
    super.key,
  });
  @override
  ConsumerState<NewPlace> createState() => _NewPlaceState();
}

class _NewPlaceState extends ConsumerState<NewPlace> {
  var titleController = TextEditingController();
  File? onPickImage;
  void _addPlace() {
    final _enteredPlace = titleController.text;

    if (_enteredPlace.isEmpty || onPickImage == null) {
      return;
    }

    ref
        .read(AddPlacesProvider.notifier)
        .toggleAddPlce(_enteredPlace, onPickImage!);

    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Place'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Title'),
              controller: titleController,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
            const SizedBox(height: 16),
            ImageInput(onPickImage: (image) {
              onPickImage = image;
            }),
            const SizedBox(height: 16),
            LocationInput(),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: _addPlace,
              icon: const Icon(Icons.add),
              label: const Text('Add Place'),
            ),
          ],
        ),
      ),
    );
  }
}
