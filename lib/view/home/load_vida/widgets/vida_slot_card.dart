import 'package:flutter/material.dart';
import 'package:vidas/model/game_saving_slot.dart';
import 'package:vidas/utils/text_utils.dart';
import 'package:vidas/view/home/load_vida/load_vida_view_model.dart';

/// Displays the main information about a vida in a card: name, age, avatar and
/// creation date. The widget accepts an [onDelete] function that is called when
/// the user swipes the card to the left.
class GameSlotCard extends StatelessWidget {
  /// The vida to display.
  final GameSavingSlot game;

  /// The function to call when the user swipes the card to the left.
  final Function(GameSavingSlot) onDelete;

  /// Creates a new [GameSlotCard] with the given [game] and sets the [onDelete]
  /// function for when the user swipes the card to the left.
  const GameSlotCard({
    super.key,
    required this.game,
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
        key: Key(game.id.toString()),
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
        onDismissed: (direction) => onDelete(game),
        child: InkWell(
          onTap: () => LoadVidaViewModel.loadGame(game, context),
          child: Container(
            height: 100,
            color: Theme.of(context).colorScheme.secondary,
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //Avatar
                Image.asset(
                  'assets/images/avatars/${game.avatarId}.png',
                  width: 50,
                  height: 100,
                  fit: BoxFit.cover,
                ),

                const SizedBox(width: 10),

                //Vida information
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Name
                      Text(
                        game.name,
                        style: textStyle?.copyWith(fontWeight: FontWeight.bold),
                      ),

                      //Age
                      Text('${game.age} years old', style: textStyle),

                      //Creation date
                      Text(
                        'Created on: ${TextUtils.dateTimeToString(game.createdOn)}',
                        overflow: TextOverflow.ellipsis,
                        style: smallTextStyle,
                      ),

                      //Last modified date
                      Text(
                        'Last modified: ${TextUtils.dateTimeToString(game.lastModified)}',
                        overflow: TextOverflow.ellipsis,
                        style: smallTextStyle,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
