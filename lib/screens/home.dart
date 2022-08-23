import 'package:flutter/material.dart';
import 'package:teste03_escribo/components/appbar.dart';
import 'package:teste03_escribo/screens/homepage.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _page = 0;

  Widget bodyFn() {
    switch (_page) {
      default:
        return const HomePage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: bodyFn(),
    );
  }
}
