import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vidas/utils/text_utils.dart';

import 'package:vidas/view/education/education_view_model.dart';

import 'package:vidas/model/education.dart';

/// Widget that displays the info on top the page. It will display an icon, and
/// three text lines: title, subtitle and details. It also includes a progress
/// bar showing performance.
class EducationInfo extends StatelessWidget {
  const EducationInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<EducationViewModel>(context);

    final Education? education = controller.getCurrentEducation();

    final String educationName = education != null
        ? TextUtils.getCourseNameFromEducation(education)
        : 'No current studies';

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
                    controller.characterName,
                    textAlign: TextAlign.start,
                  ),

                  //Education course
                  Text(
                    educationName,
                    textAlign: TextAlign.start,
                  ),

                  //Grade
                  Text(
                    education == null ? '' : 'Grade: ${education.grade}/100',
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        // height: 15,
        const Column(
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
