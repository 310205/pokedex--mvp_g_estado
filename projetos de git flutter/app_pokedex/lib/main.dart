//main.

import 'package:app_pokedex/model/pokemon_repository.dart';
import 'package:app_pokedex/presenter/presenter_controler.dart';
import 'package:provider/provider.dart';
import 'package:app_pokedex/model/pokemon.dart';

import 'package:flutter/material.dart';

import 'view/home_page.dart';
import 'view/tela_detalhes.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => PresenterControler(PokemonRepository())),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/teladetalhes': (context) => TelaDetalhes(
            detalhes: ModalRoute.of(context)?.settings.arguments as Pokemon),
      },
    );
  }
}
