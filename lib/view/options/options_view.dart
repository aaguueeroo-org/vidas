import 'package:flutter/material.dart';

import 'package:vidas/model/vida.dart';
import 'package:vidas/view/options/options_controller.dart';


/// View that shows the options of the game.
class OptionsView extends StatelessWidget {
  /// The [Vida] that is being played.
  final Vida vida;

  /// Creates a new [OptionsView] with the given [vida].
  const OptionsView({
    super.key,
    required this.vida,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.primaryContainer,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              //Back button
              const Align(
                alignment: Alignment.topLeft,
                child: BackButton(),
              ),

              //Save game button
              ElevatedButton(
                child: const Text('Save game'),
                onPressed: () => OptionsController.saveGame(),
              ),

              //Quit game button
              ElevatedButton(
                child: const Text('Quit game'),
                onPressed: () => OptionsController.quitGame(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
