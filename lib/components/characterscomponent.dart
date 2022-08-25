import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:teste03_escribo/db/db.dart';
import '../models/character.dart';

class Charactrs extends StatefulWidget {
  const Charactrs({Key? key}) : super(key: key);

  @override
  State<Charactrs> createState() => _CharactersState();
}

class _CharactersState extends State<Charactrs> {
  late Future<List<Character>> futureCharacter;
  late Icon icon;

  Future<List<Character>> loadFilms() async {
    final characters =
        await http.get(Uri.parse('https://swapi.dev/api/people'));

    if (characters.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      List<dynamic> body = jsonDecode(characters.body)['results'];
      var favorites = await DB.getFavoriteCharacters();

      List<Character> character = body
          .map(
            (dynamic item) => Character.fromJson(item, favorites
                .any((element) => element.values.contains(item["name"]))),
          )
          .toList();

      return character;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load films');
    }
  }

  @override
  void initState() {
    super.initState();
    futureCharacter = loadFilms();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: futureCharacter,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasData) {
          List<Character> characters = snapshot.data;

          return ListView.builder(
            itemCount: characters.length,
            itemBuilder: (BuildContext context, int id) {
              if (characters[id].isFavorite) {
                icon = const Icon(
                  Icons.favorite,
                  color: Colors.red,
                );
              } else {
                icon = const Icon(
                  Icons.favorite_border,
                  color: Colors.red,
                );
              }

              return Card(
                child: ListTile(
                  title: Text(characters[id].name),
                  trailing: IconButton(
                    icon: icon,
                    onPressed: () async {
                      if (characters[id].isFavorite) {
                        DB.deleteFavoriteByName(characters[id].name);
                        setState(() {
                          characters[id].isFavorite = false;
                          icon = const Icon(
                            Icons.favorite_border,
                            color: Colors.red,
                          );
                        });
                      } else {
                        DB.createFavorite(characters[id].name, "character");
                        setState(() {
                          characters[id].isFavorite = true;
                          icon = const Icon(
                            Icons.favorite,
                            color: Colors.red,
                          );
                        });
                      }
                    },
                  ),
                ),
              );
            },
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
