import 'package:flutter/material.dart';

import 'package:vidas/model/education/education.dart';
import 'package:vidas/view/education/list_of_titles/education_list_item_popup_menu.dart';

class EducationListItem extends StatelessWidget {
  final Education education;

  const EducationListItem({
    super.key,
    required this.education,
  });

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).colorScheme.tertiary;
    TextStyle? titleStyle = Theme.of(context).textTheme.headlineSmall!;
    TextStyle? textStyle = Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: color,
        );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        leading: Icon(
          Icons.school,
          size: 50,
          color: color,
        ),
        title: Text(
          education.name,
          overflow: TextOverflow.ellipsis,
          style: titleStyle,
        ),
        subtitle: Text(
          'Grade: ${education.grade}',
          style: textStyle,
        ),
        trailing: education.canDropOut()
            ? EducationListItemPopupMenu(education: education)
            : null,
      ),
    );
  }
}
