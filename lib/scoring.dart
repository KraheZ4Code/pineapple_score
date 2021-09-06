import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'game.dart';

class ScoringScreen extends StatelessWidget {
  // In the constructor, require a Todo.
  const ScoringScreen({Key key, this.game}) : super(key: key);

  // Declare a field that holds the Todo.
  final Game game;

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    return Scaffold(
      appBar: AppBar(
        title: Text(game.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
      ),
    );
  }
}