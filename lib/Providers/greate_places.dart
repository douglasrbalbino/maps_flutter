// Pega os itens

import 'package:flutter/material.dart';
import 'package:maps_application/Models/place.dart';

class GreatePlaces with ChangeNotifier {
  final List<Place> _items = [];

  List<Place> get items {
    return [..._items]; // não retorna diretamente para a lista)
  }

  int get itemsCount {
    return _items.length; // os itens virão para este trecho
  }

  Place itemByIndex(int index) {
    return _items[index];
  }
}
