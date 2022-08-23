import 'package:flutter/material.dart';
import 'package:teste03_escribo/components/filmcomponent.dart';
import 'package:teste03_escribo/components/characterscomponent.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Widget? films;
  late Widget? characters;

  @override
  void initState() {
    super.initState();
    films = const Films();
    characters = const Charactrs();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        DefaultTabController(
          length: 3,
          initialIndex: 0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const TabBar(
                labelColor: Colors.black,
                tabs: [
                  Tab(text: 'Filmes'),
                  Tab(text: 'Personagens'),
                  Tab(text: 'Favoritos'),
                ],
              ),
              Container(
                height: 550,
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(color: Colors.grey, width: 0.5),
                  ),
                ),
                child: TabBarView(
                  children: <Widget>[
                    Center(
                      child: films,
                    ),
                    Center(
                      child: characters,
                    ),
                    const Center(
                      child: Text(
                        'Favoritos',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
