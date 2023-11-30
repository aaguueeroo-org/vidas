import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vidas/view/home/new_vida/widgets/choose_avatar.dart';
import 'package:vidas/view/home/new_vida/widgets/gender_dropdown.dart';
import 'package:vidas/view/home/new_vida/new_vida_view_model.dart';

class NewVidaDialog extends StatelessWidget {
  const NewVidaDialog({super.key});

  @override
  Widget build(BuildContext context) {
    NewVidaViewModel controller = Provider.of<NewVidaViewModel>(
      context,
    );

    TextStyle? labelStyle = Theme.of(context).textTheme.bodySmall?.copyWith(
          color: Theme.of(context).colorScheme.onSurface,
        );

    double padding = 20;

    return Dialog(
      insetPadding: EdgeInsets.symmetric(
        horizontal: padding,
        vertical: padding,
      ),
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(30),
        ),
        child: ListView(
          shrinkWrap: true,
          children: [
            // Upper row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const BackButton(),
                ElevatedButton(
                  child: const Text('Random'),
                  onPressed: () => controller.randomizeVidaParameters(),
                ),
              ],
            ),

            //Name and Sex row
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  flex: 20,
                  child: TextField(
                    controller: controller.nameController,
                    decoration: InputDecoration(
                      labelText: 'Name',
                      labelStyle: labelStyle,
                    ),
                  ),
                ),
                const Spacer(),
                Expanded(
                  flex: 10,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Gender',
                        style: labelStyle,
                      ),
                      const GenderDropdown(),
                    ],
                  ),
                ),
              ],
            ),

            //Sliders
            // const Expanded(
            //   flex: 15,
            //   child: Sliders(),
            // ),
            // const Spacer(),

            //Choose avatar
            const ChooseAvatar(),

            //Start Vida button
            ElevatedButton(
              onPressed: () {
                if(controller.nameController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please enter a name'),
                    ),
                  );
                }
                controller.newGame();
              },
              child: const Text('Start Vida'),
            ),
          ],
        ),
      ),
    );
  }

  static show(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => ChangeNotifierProvider(
        create: (context) => NewVidaViewModel(),
        child: const NewVidaDialog(),
      ),
    );
  }
}
