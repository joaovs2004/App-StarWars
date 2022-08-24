import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/film.dart';

class Films extends StatefulWidget {
  const Films({Key? key}) : super(key: key);

  @override
  State<Films> createState() => _FilmsState();
}

class _FilmsState extends State<Films> {
  late Future<List<Film>> futureFilm;

  Future<List<Film>> loadFilms() async {
    final films = await http.get(Uri.parse('https://swapi.dev/api/films'));

    if (films.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      List<dynamic> body = jsonDecode(films.body)['results'];

      List<Film> film = body
          .map(
            (dynamic item) => Film.fromJson(item),
          )
          .toList();

      return film;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load films');
    }
  }

  @override
  void initState() {
    super.initState();
    futureFilm = loadFilms();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: futureFilm,
      builder: (BuildContext context, AsyncSnapshot<List<Film>> snapshot) {
        if (snapshot.hasData) {
          List<Film> films = snapshot.data ?? <Film>[];
          return ListView(
            children: films
                .map(
                  (Film post) => Card(
                    child: ListTile(
                      title: Text(post.title),
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
