import 'package:flutter/material.dart';

class PlayerInfo extends StatelessWidget {
  final String fullName;
  final String age;
  final String title;

  const PlayerInfo({
    super.key,
    required this.fullName,
    required this.age,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {

    return Row(
      children: [
        // Flexible(
        //   flex: 10,
        //   child: Container(
        //     alignment: Alignment.center,
        //     child: FittedBox(
        //         fit: BoxFit.contain,
        //         child: ColorFiltered(
        //           colorFilter: const ColorFilter.matrix([
        //             0.2126 + 0.7874 * 0.2, 0.7152 - 0.7152 * 0.2, 0.0722 - 0.0722 * 0.2, 0, 0,
        //             0.2126 - 0.2126 * 0.2, 0.7152 + 0.2848 * 0.2, 0.0722 - 0.0722 * 0.2, 0, 0,
        //             0.2126 - 0.2126 * 0.2, 0.7152 - 0.7152 * 0.2, 0.0722 + 0.9278 * 0.2, 0, 0,
        //             0,                    0,                    0,                    1, 0,
        //           ]),
        //           child: Image.asset(
        //             controller.avatar,
        //             height: 150,
        //           ),
        //         )),
        //   ),
        // ),
        const Spacer(),
        Flexible(
          flex: 28,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              //Player name and last name
              Text(
                fullName,
                textAlign: TextAlign.start,
              ),

              //Player age
              Text(
                '$age years old',
                textAlign: TextAlign.start,
              ),

              //Player job position or study
              Text(
                title,
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
