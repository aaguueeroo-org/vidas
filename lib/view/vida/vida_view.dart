import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vidas/view/vida/vida_view_model.dart';
import 'package:vidas/view/vida/widgets/player_info.dart';
import 'package:vidas/view/vida/widgets/tool_bar.dart';

/// Shows the main game view.
class VidaView extends StatelessWidget {
  const VidaView({super.key});

  @override
  Widget build(BuildContext context) {
    VidaViewModel controller = Provider.of<VidaViewModel>(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //Money and buttons
            const ToolBar(),

            //Player info
            const PlayerInfo(),
            const Spacer(),

            //Main actions
            // Flexible(
            //   flex: 25,
            //   child: Row(
            //     crossAxisAlignment: CrossAxisAlignment.stretch,
            //     children: [
            //       SizedBox(
            //         width: width / 20,
            //         child: EnergyBar(
            //           energyLevel: controller.energy,
            //           vertical: true,
            //         ),
            //       ),
            //       const Spacer(),
            //       const Expanded(
            //         flex: 19,
            //         child: ActionButtons(),
            //       ),
            //     ],
            //   ),
            // ),
            // const Spacer(),

            //log
            // const Flexible(
            //   flex: 13,
            //   child: LogContainer(),
            // ),
            // const Spacer(),

            //next year button
            ElevatedButton(
              onPressed: () => controller.nextYearPressed(),
              child: const Text('Next year'),
            ),
          ],
        ),
      ),
    );
  }
}
