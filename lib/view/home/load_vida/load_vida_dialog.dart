import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vidas/model/game_saving_slot.dart';
import 'package:vidas/view/home/load_vida/widgets/vida_slot_card.dart';

import 'package:vidas/view/home/load_vida/load_vida_view_model.dart';

/// Shows a list of saved games and allows the user to either delete them or
/// load them.
class LoadVidaDialog extends StatefulWidget {
  const LoadVidaDialog({super.key});

  @override
  State<LoadVidaDialog> createState() => _LoadVidaDialogState();

  /// Shows the dialog and adds a [LoadVidaViewModel] to the widget tree.
  static Future<void> show(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (context) => ChangeNotifierProvider(
        create: (context) => LoadVidaViewModel(),
        builder: (context, child) => const LoadVidaDialog(),
      ),
    );
  }
}

class _LoadVidaDialogState extends State<LoadVidaDialog> {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<LoadVidaViewModel>(context);

    return Dialog(
      insetPadding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 30,
      ),
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BackButton(),
            FutureBuilder<List<GameSavingSlot>>(
              future: LoadVidaViewModel.getAllSavedGames(),
              builder: (context, snapshot) {

                // If there are saved games, show them
                if (snapshot.hasData) {
                  List<GameSavingSlot> vidas = snapshot.data!;

                  // Saved games list
                  return ListView.separated(
                    shrinkWrap: true,
                    itemCount: vidas.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 10),
                    itemBuilder: (context, index) {
                      return GameSlotCard(
                        game: vidas[index],
                        onDelete: (vida) {
                          // Removes item in the view
                          setState(() {
                            vidas.removeAt(index);
                          });
                          //Removes item in the database
                          controller.deleteGame(vida.id);
                        },
                      );
                    },
                  );
                }

                // Show a loading indicator while the data is loading
                else if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                // If there are no saved games, show a message
                else {
                  return const Center(
                    child: Text('No saved games'),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
