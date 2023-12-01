import 'package:flutter/material.dart';
import 'package:vidas/model/vida.dart';
import 'package:vidas/view/home/load_vida/load_vida_view_model.dart';

/// Displays the main information about a vida in a card: name, age, avatar and
/// creation date. The widget accepts an [onDelete] function that is called when
/// the user swipes the card to the left.
class VidaSlotCard extends StatelessWidget {

  /// The vida to display.
  final Vida vida;

  /// The function to call when the user swipes the card to the left.
  final Function(int) onDelete;

  /// Creates a new [VidaSlotCard] with the given [vida] and sets the [onDelete]
  /// function for when the user swipes the card to the left.
  const VidaSlotCard({
    super.key,
    required this.vida,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle? textStyle = Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: Theme.of(context).colorScheme.onSecondary,
        );
    TextStyle? smallTextStyle = Theme.of(context).textTheme.bodySmall?.copyWith(
          color: Theme.of(context).colorScheme.onSecondary,
        );

    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Dismissible(
        key: Key(vida.id!.toString()),
        direction: DismissDirection.endToStart,
        background: Container(
          alignment: Alignment.centerRight,
          color: Colors.red,
          child: const Icon(
            Icons.delete,
            color: Colors.white,
            size: 40,
          ),
        ),
        //Function called when the user swipes the card to the left
        onDismissed: (direction) => onDelete(vida.id!),
        child: InkWell(
          onTap: () => LoadVidaViewModel.loadGame(vida, context),
          child: Container(
            height: 100,
            color: Theme.of(context).colorScheme.secondary,
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                //Vida information
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Name
                    Text(vida.name, style: textStyle),

                    //Age
                    Text('${vida.age} years old', style: textStyle),

                    //Saved date
                    //TODO implement saving date
                    Text('23/07/2023', style: smallTextStyle),
                  ],
                ),

                //Avatar
                Image.asset('assets/images/avatars/${vida.avatarId}.png'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
