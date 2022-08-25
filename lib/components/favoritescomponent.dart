import 'dart:async';
import 'package:flutter/material.dart';
import 'package:teste03_escribo/db/db.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  late Future<List<Map<String, dynamic>>> futureFavorites;

  @override
  void initState() {
    super.initState();

    futureFavorites = DB.getFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: futureFavorites,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasData) {
          List<Map<String, dynamic>> favorites = snapshot.data;

          if (favorites.isNotEmpty) {
            return ListView.builder(
              itemCount: favorites.length,
              itemBuilder: (BuildContext context, int id) {
                Color? color;

                if (favorites[id]["type"] == "character") {
                  color = Colors.green;
                } else {
                  color = Colors.red;
                }

                return Card(
                  color: color,
                  child: ListTile(
                    title: Text(favorites[id]["name"]),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        DB.deleteFavorite(favorites[id]["id"]);
                        setState(() {
                          futureFavorites = DB.getFavorites();
                        });
                      },
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: Text("Favoritos"),
            );
          }
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
