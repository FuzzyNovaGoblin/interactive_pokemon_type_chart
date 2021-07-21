import 'package:flutter/material.dart';
import 'package:live_pokemon_type_grid/FuzColors.dart';
import 'package:live_pokemon_type_grid/HomePage.dart';

void main() {
  runApp(BaseApp());
}

class BaseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokemon Type Gird Live',
      theme: ThemeData(
        primarySwatch: FuzColors.main,
      ),
      home: HomePage(),
    );
  }
}
