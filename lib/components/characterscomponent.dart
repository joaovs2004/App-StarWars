import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/character.dart';

class Charactrs extends StatefulWidget {
  const Charactrs({Key? key}) : super(key: key);

  @override
  State<Charactrs> createState() => _CharactersState();
}

class _CharactersState extends State<Charactrs> {
  late Future<List<Character>> futureCharacter;

  Future<List<Character>> loadFilms() async {
    final characters = await http.get(Uri.parse('https://swapi.dev/api/people'));

    if (characters.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      List<dynamic> body = jsonDecode(characters.body)['results'];
      List<Character> character = body
          .map(
            (dynamic item) => Character.fromJson(item),
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
      builder: (BuildContext context, AsyncSnapshot<List<Character>> snapshot) {
        if (snapshot.hasData) {
          List<Character> films = snapshot.data ?? <Character>[];
          return ListView(
            children: films
                .map(
                  (Character post) => Card(
                    child: ListTile(
                      title: Text(post.name),
                      trailing: const IconButton(
                        icon: Icon(Icons.favorite),
                        onPressed: null,
                      ),
                    ),
                  ),
                )
                .toList(),
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
