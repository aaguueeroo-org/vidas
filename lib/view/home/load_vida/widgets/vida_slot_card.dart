import 'package:flutter/material.dart';
import 'package:vidas/model/vida.dart';


class VidaSlotCard extends StatelessWidget {
  final Vida vida;
  final Function(int) onDelete;

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
        onDismissed: (direction) => onDelete(vida.id!),
        child: InkWell(
          onTap: () {},
          child: Container(
            height: 100,
            color: Theme.of(context).colorScheme.secondary,
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(vida.name, style: textStyle),
                    Text('${vida.age} years old', style: textStyle),
                    //TODO implement saving date
                    Text('23/07/2023', style: smallTextStyle),
                  ],
                ),
                Image.asset('assets/images/avatars/${vida.avatarId}.png'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
