import 'package:flutter/material.dart';
import 'package:vidas/view/home/home_controller.dart';
import 'package:vidas/view/home/new_vida/new_vida_dialog.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
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
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(flex: 8),

            //New vida button
            ElevatedButton(
              onPressed: () => NewVidaDialog.show(context),
              child: const Text('New vida'),
            ),
            const SizedBox(height: 10),

            //Load vida button
            ElevatedButton(
              onPressed: () => HomeController.loadGame(context),
              child: const Text('Load vida'),
            ),
            const SizedBox(height: 10),

            const Spacer(flex: 10),

            // Credits and socials
            const Column(
              children: [
                Text('Julia Agüero'),
                SizedBox(height: 10),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.account_circle_outlined),
                    SizedBox(width: 5),
                    Icon(Icons.account_balance),
                  ],
                ),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
