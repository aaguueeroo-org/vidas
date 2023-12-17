import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:vidas/model/education/education.dart';
import 'package:vidas/view/education/education_view_model.dart';

class EducationListItemPopupMenu extends StatelessWidget {
  final Education education;

  const EducationListItemPopupMenu({
    super.key,
    required this.education,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<EducationViewModel>(context);

    return PopupMenuButton(
      icon: const Icon(Icons.more_vert),
      itemBuilder: (context) => [
        const PopupMenuItem(
          value: 'drop_out',
          child: Text('Drop out'),
        ),
      ],
      onSelected: (value) {
        switch (value) {
          case 'drop_out':
            controller.dropOut(education);
            break;
        }
      },
    );
  }
}