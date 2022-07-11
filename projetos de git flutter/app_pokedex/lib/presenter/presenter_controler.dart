import 'package:app_pokedex/model/pokemon_repository.dart';
import 'package:flutter/cupertino.dart';

import '../model/pokemon.dart';

class PresenterControler with ChangeNotifier {
  final PokemonRepository _repository;

  PresenterControler(this._repository);
  List<Pokemon> pokemonList = [];
  bool loading = true;
  void getPokemon() {
    loading = true;
    _repository.getPokemon().then((value) {
      pokemonList = value;
      notifyListeners();
      loading = false;
    });
  }
}
