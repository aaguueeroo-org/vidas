import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vidas/config/app_routes.dart';

import 'package:vidas/view/vida/vida_view_model.dart';

/// Displays information about the player's money and the buttons to access
/// the store, debug view and options view.
class ToolBar extends StatelessWidget {
  const ToolBar({super.key});

  @override
  Widget build(BuildContext context) {
    VidaViewModel controller = Provider.of<VidaViewModel>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

        //Money available
        Icon(
          Icons.currency_bitcoin,
          color: Theme.of(context).colorScheme.secondary,
          size: 30,
        ),
        const Text('3000€'),

        const Spacer(),

        //Debug view
        IconButton(
          visualDensity: VisualDensity.compact,
          padding: const EdgeInsets.all(0),
          constraints: const BoxConstraints(),
          icon: const Icon(
            Icons.bug_report,
            size: 30,
          ),
          color: Theme.of(context).colorScheme.secondary,
          onPressed: null,
          // onPressed: () => controller.showDebugView(context),
        ),

        //Store button
        IconButton(
          visualDensity: VisualDensity.compact,
          padding: const EdgeInsets.all(0),
          constraints: const BoxConstraints(),
          icon: const Icon(
            Icons.store,
            size: 30,
          ),
          color: Theme.of(context).colorScheme.secondary,
          onPressed: () {},
        ),

        //Vida settings button
        IconButton(
          visualDensity: VisualDensity.compact,
          padding: const EdgeInsets.all(0),
          constraints: const BoxConstraints(),
          icon: const Icon(
            Icons.save_as,
            size: 30,
          ),
          color: Theme.of(context).colorScheme.secondary,
          // onPressed: null,
          onPressed: () => AppRoutes.pushOptionView(context, controller.vida),
        ),
      ],
    );
  }
}
