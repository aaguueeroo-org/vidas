import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:vidas/view/education/education_view_model.dart';

import 'package:vidas/model/education.dart';

class EducationList extends StatelessWidget {
  const EducationList({super.key});

  @override
  Widget build(BuildContext context) {
    TextStyle? titleStyle = Theme.of(context).textTheme.titleLarge!;

    final controller = Provider.of<EducationViewModel>(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Titles:',
          style: titleStyle,
        ),
        (controller.educations.isEmpty)
            ? const Center(
                child: Text('No educatioooot'),
              )
            : Expanded(
                child: ListView.builder(
                  itemCount: controller.educations.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return EducationListItem(
                      education: controller.educations[index],
                    );
                  },
                ),
              )
        // ListView.builder(itemBuilder: Edu),
      ],
    );
  }
}

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

    final String educationName = education.levelName == 'Preeschool' ||
            education.levelName == 'Middle school'
        ? education.levelName
        : '${education.levelName} - ${education.field}';

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        leading: Icon(
          Icons.school,
          size: 50,
          color: color,
        ),
        title: Text(
          educationName,
          overflow: TextOverflow.ellipsis,
          style: titleStyle,
        ),
        subtitle: Text(
          'Grade: ${education.grade}',
          style: textStyle,
        ),
        trailing: education.canDropOut()
            ? EducationPopupMenu(
                education: education,
              )
            : null,
      ),
    );
  }
}

class EducationPopupMenu extends StatelessWidget {
  final Education education;

  const EducationPopupMenu({
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
