import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vidas/view/education/dialogs/education_actions_dialog.dart';

import 'package:vidas/view/education/education_view_model.dart';
import 'package:vidas/view/education/dialogs/education_enroll_dialog.dart';

class EducationActionButton extends StatelessWidget {
  const EducationActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<EducationViewModel>(context);

    return controller.isCurrentlyEnrolled()
        ? ElevatedButton(
            onPressed: () => EducationActionsDialog.show(context),
            child: const Text('Actions'),
          )
        : ElevatedButton(
            onPressed: () => EducationEnrollDialog.show(context),
            child: const Text('Enroll'),
          );
  }
}
