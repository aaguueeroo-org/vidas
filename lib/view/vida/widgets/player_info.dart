import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:vidas/view/vida/vida_view_model.dart';

/// Widget to display the main info of the player. It shows the avatar,
/// name, age and job position or study.
class PlayerInfo extends StatelessWidget {
  const PlayerInfo({super.key});

  @override
  Widget build(BuildContext context) {
    VidaViewModel controller = Provider.of<VidaViewModel>(context);

    return Row(
      children: [
        //Avatar
        ColorFiltered(
          colorFilter: const ColorFilter.matrix(
            [
              0.2126 + 0.7874 * 0.2,
              0.7152 - 0.7152 * 0.2,
              0.0722 - 0.0722 * 0.2,
              0,
              0,
              0.2126 - 0.2126 * 0.2,
              0.7152 + 0.2848 * 0.2,
              0.0722 - 0.0722 * 0.2,
              0,
              0,
              0.2126 - 0.2126 * 0.2,
              0.7152 - 0.7152 * 0.2,
              0.0722 + 0.9278 * 0.2,
              0,
              0,
              0,
              0,
              0,
              1,
              0,
            ],
          ),
          child: Image.asset(
            'assets/images/avatars/${controller.vida.avatarId}.png',
            height: 120,
            width: 120,
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Player name and last name
              Text(
                controller.vida.name,
                textAlign: TextAlign.start,
              ),

              //Player age
              Text(
                '${controller.vida.age} years old',
                textAlign: TextAlign.start,
              ),

              //Player job position or study
              Text(
                controller.vida.gender.toString(),
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
