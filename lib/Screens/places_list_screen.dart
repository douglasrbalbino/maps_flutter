import 'package:flutter/material.dart';
import 'package:maps_application/Providers/greate_places.dart';
import 'package:maps_application/utils/app_routes.dart';
import 'package:provider/provider.dart';

class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minha Lista'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.placeForm);
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Consumer<GreatePlaces>(
        child: const Center(child: Text('Nenhum local cadastrado!')),
        builder: (context, greatePlaces, child) => greatePlaces.itemsCount == 0
            ? child!
            : ListView.builder(
                itemCount: greatePlaces.itemsCount,
                itemBuilder: (context, i) => ListTile(
                  leading: CircleAvatar(
                    backgroundImage: FileImage(
                      greatePlaces.itemByIndex(i).image,
                    ),
                  ),
                  title: Text(greatePlaces.itemByIndex(i).title),
                  onTap: () {},
                ),
              ),
      ),
    );
  }
}
