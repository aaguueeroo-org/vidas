import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:vidas/view/home/new_vida/new_vida_view_model.dart';

class ChooseAvatar extends StatelessWidget {
  const ChooseAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<NewVidaViewModel>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Text(
          'Avatar',
        ),
        Row(
          children: [

            // Left arrow
            IconButton(
              onPressed: () => controller.changeAvatar(false),
              icon: const Icon(Icons.arrow_back_ios),
            ),

            // Avatar image
            Expanded(
              child: ColorFiltered(
                colorFilter: const ColorFilter.matrix([
                  0.2126 + 0.7874 * 0.2, 0.7152 - 0.7152 * 0.2, 0.0722 - 0.0722 * 0.2, 0, 0,
                  0.2126 - 0.2126 * 0.2, 0.7152 + 0.2848 * 0.2, 0.0722 - 0.0722 * 0.2, 0, 0,
                  0.2126 - 0.2126 * 0.2, 0.7152 - 0.7152 * 0.2, 0.0722 + 0.9278 * 0.2, 0, 0,
                  0,                    0,                    0,                    1, 0,
                ]),
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: SizedBox(
                    height: 90,
                    width: 100,
                    child: Image.asset(
                      'assets/images/avatars/${controller.selectedAvatar}.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),

            // Right arrow
            IconButton(
              onPressed: () => controller.changeAvatar(true),
              icon: const Icon(Icons.arrow_forward_ios),
            ),
          ],
        ),
      ],
    );
  }
}
