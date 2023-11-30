import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vidas/view/vida/vida_view_model.dart';
import 'package:vidas/view/vida/widgets/player_info.dart';

class VidaView extends StatelessWidget {
  const VidaView({super.key});

  @override
  Widget build(BuildContext context) {
    VidaViewModel controller = Provider.of<VidaViewModel>(context);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // const Flexible(
          //   flex: 2,
          //   child: ToolBar(),
          // ),
          const Spacer(),
          Flexible(
            flex: 6,
            child: PlayerInfo(
              fullName: controller.name,
              age: controller.age.toString(),
              title:
                  controller.gender.toString(), //TODO substitute for position
            ),
          ),
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
    );
  }
}
