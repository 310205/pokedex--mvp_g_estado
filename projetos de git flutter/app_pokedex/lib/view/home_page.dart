//home

import 'package:app_pokedex/presenter/presenter_controler.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pokemon_widgwet.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<PresenterControler>().getPokemon();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokedex'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Image.network(
                'https://raw.githubusercontent.com/RafaelBarbosatec/SimplePokedex/master/assets/pokebola_img.png'),
          ),
        ],
      ),
      body: Consumer<PresenterControler>(
        builder: (_, controller, child) {
          return ListView.builder(
              itemCount: controller.pokemonList.length,
              itemBuilder: (context, index) {
                return PokemonWidget(item: controller.pokemonList[index]);
              });
        },
      ),
    );
  }
}
