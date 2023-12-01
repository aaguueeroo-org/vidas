import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vidas/model/vida.dart';
import 'package:vidas/view/home/load_vida/widgets/vida_slot_card.dart';

import 'package:vidas/view/home/load_vida/load_vida_view_model.dart';

class LoadVidaDialog extends StatefulWidget {
  const LoadVidaDialog({super.key});

  @override
  State<LoadVidaDialog> createState() => _LoadVidaDialogState();

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
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BackButton(),
            Expanded(
              child: FutureBuilder<List<Vida>>(
                future: controller.getAllSavedGames(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Vida> vidas = snapshot.data!;

                    return ListView.builder(
                      itemCount: vidas.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 0,
                          ),
                          child: VidaSlotCard(
                            vida: vidas[index],
                            onDelete: (vidaId) {

                              setState(() {
                                vidas.removeAt(index);
                              });

                              controller.deleteGame(vidaId);
                            },
                          ),
                        );
                      },
                    );
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return const Center(
                      child: Text('No saved games'),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
