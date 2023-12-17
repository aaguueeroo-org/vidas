import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vidas/view/education/widgets/education_action_button.dart';
import 'package:vidas/view/education/widgets/education_info.dart';
import 'package:vidas/view/education/list_of_titles/education_list.dart';

import 'package:vidas/view/education/education_view_model.dart';

class EducationView extends StatelessWidget {
  const EducationView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<EducationViewModel>(context);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: const [],
      ),
      body: controller.age < 3
          ? const Center(
              child: Text('Too young'),
            )
          : const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                EducationInfo(),
                EducationActionButton(),
                Expanded(child: EducationList()),
              ],
            ),
    );
  }
}
