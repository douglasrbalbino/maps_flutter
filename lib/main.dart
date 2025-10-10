import 'package:flutter/material.dart';
import 'package:maps_application/Screens/place_form_screen.dart';
import 'package:maps_application/Screens/places_list_screen.dart';
import 'package:maps_application/utils/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        hintColor: Colors.amber,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ), // Deixa a aplicação responsiva
      home: PlacesListScreen(),
      routes: {AppRoutes.placeForm: (ctx) => PlaceFormScreen()},
      debugShowCheckedModeBanner: false,
    );
  }
}
