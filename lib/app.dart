import 'package:flutter/material.dart';
import 'package:maps_application/Screens/places_list_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        hintColor: Colors.amber,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ), // Deixa a aplicação responsiva
      home: PlacesListScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
