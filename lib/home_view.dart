import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    InitController controller = Provider.of<InitController>(
      context,
      listen: false,
    );

    return Scaffold(
      body: Container(
        height: double.infinity,
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
            ElevatedButton(
              onPressed: () => controller.showNewVidaOptions(context),
              child: const Text("New vida"),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () => controller.showLoadedGames(context),
              child: const Text("Load vida"),
            ),
            const SizedBox(
              height: 10,
            ),
            const Spacer(flex: 10),
            const Column(
              children: [
                Text(
                  "Julia Agüero",
                ),
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
