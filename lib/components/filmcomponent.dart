import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:teste03_escribo/db/db.dart';
import '../models/film.dart';

class Films extends StatefulWidget {
  const Films({Key? key}) : super(key: key);

  @override
  State<Films> createState() => _FilmsState();
}

class _FilmsState extends State<Films> {
  late Future<List<Film>> futureFilm;
  late Icon icon;

  Future<List<Film>> loadFilms() async {
    final films = await http.get(Uri.parse('https://swapi.dev/api/films'));

    if (films.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      List<dynamic> body = jsonDecode(films.body)['results'];
      var favorites = await DB.getFavoriteFilms();

      List<Film> film = body
          .map(
            (dynamic item) => Film.fromJson(
                item,
                favorites
                    .any((element) => element.values.contains(item["title"]))),
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
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasData) {
          List<Film> films = snapshot.data;

          return ListView.builder(
            itemCount: films.length,
            itemBuilder: (BuildContext context, int id) {
              if (films[id].isFavorite) {
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
                  title: Text(films[id].title),
                  trailing: IconButton(
                    icon: icon,
                    onPressed: () async {
                      if (films[id].isFavorite) {
                        DB.deleteFavoriteByName(films[id].title);
                        setState(() {
                          films[id].isFavorite = false;
                          icon = const Icon(
                            Icons.favorite_border,
                            color: Colors.red,
                          );
                        });
                      } else {
                        DB.createFavorite(films[id].title, "film");
                        setState(() {
                          films[id].isFavorite = true;
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
