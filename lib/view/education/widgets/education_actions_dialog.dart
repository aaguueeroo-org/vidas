import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:vidas/view/education/education_view_model.dart';

class EducationActionsDialog extends StatelessWidget {
  const EducationActionsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    // final controller = Provider.of<EducationViewModel>(context, listen: false);

    return Dialog(
      child: SizedBox(
        height: 300,
        width: 200,
        child: ListView(
          children: [],
        ),
      ),
    );
  }

  static void show(BuildContext context) {
    final controller = Provider.of<EducationViewModel>(context, listen: false);

    showDialog(
      context: context,
      builder: (context) => ChangeNotifierProvider.value(
        value: controller,
        child: const EducationActionsDialog(),
      ),
    );
  }
}
