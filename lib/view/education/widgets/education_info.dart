import 'package:flutter/material.dart';

import '../../../model/education.dart';

/// Widget that displays the info on top the page. It will display an icon, and
/// three text lines: title, subtitle and details. It also includes a progress
/// bar showing performance.
class EducationInfo extends StatelessWidget {
  final String playerName;
  final String? field;
  final double grade;
  final List<Education> educationHistory;

  const EducationInfo({
    super.key,
    required this.playerName,
    required this.field,
    required this.grade,
    required this.educationHistory,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Flexible(
              flex: 10,
              child: Container(
                alignment: Alignment.center,
                child: const FittedBox(
                  fit: BoxFit.contain,
                  child: Icon(
                    Icons.school,
                    size: 150,
                  ),
                ),
              ),
            ),
            const Spacer(),
            Flexible(
              flex: 28,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  //Player name and last name
                  Text(
                    playerName,
                    textAlign: TextAlign.start,
                  ),

                  //Player age
                  Text(
                    field == null
                        ? 'No current studies'
                        : 'Course: $field',
                    textAlign: TextAlign.start,
                  ),

                  //Player job position or study
                  Text(
                    grade == null ? '' : 'Grade: $grade/100',
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        // height: 15,
        Column(
          children: [
            // const SizedBox(
            //   height: 15,
            //   child: EnergyBar(
            //     energyLevel: 0.4,
            //     vertical: false,
            //     borderRadius: 12,
            //   ),
            // ),
            // Text(
            //   'Grade',
            // ),
          ],
        ),
      ],
    );
  }
}
